#include <iostream>
#include <stdio.h>
#include <string.h>
#include <string>

#define GET_FUNC_GOT_ADDR(func_name) ((uint64_t)(&func_name)+(*(uint32_t *)((uint8_t *)(&func_name)+2))+6)
#define LOG(...) ;//printf(__VA_ARGS__);printf("\n");fflush(stdout)

// this implementation of sha256 is from http://www.zedwood.com/article/cpp-sha256-function
class SHA256
{
protected:
    typedef unsigned char uint8;
    typedef unsigned int uint32;
    typedef unsigned long long uint64;

    const static uint32 sha256_k[];
    static const unsigned int SHA224_256_BLOCK_SIZE = (512/8);
public:
    void init();
    void update(const unsigned char *message, unsigned int len);
    void final(unsigned char *digest);
    static const unsigned int DIGEST_SIZE = ( 256 / 8);

protected:
    void transform(const unsigned char *message, unsigned int block_nb);
    unsigned int m_tot_len;
    unsigned int m_len;
    unsigned char m_block[2*SHA224_256_BLOCK_SIZE];
    uint32 m_h[8];
};

std::string sha256(std::string input);

#define SHA2_SHFR(x, n)    (x >> n)
#define SHA2_ROTR(x, n)   ((x >> n) | (x << ((sizeof(x) << 3) - n)))
#define SHA2_ROTL(x, n)   ((x << n) | (x >> ((sizeof(x) << 3) - n)))
#define SHA2_CH(x, y, z)  ((x & y) ^ (~x & z))
#define SHA2_MAJ(x, y, z) ((x & y) ^ (x & z) ^ (y & z))
#define SHA256_F1(x) (SHA2_ROTR(x,  2) ^ SHA2_ROTR(x, 13) ^ SHA2_ROTR(x, 22))
#define SHA256_F2(x) (SHA2_ROTR(x,  6) ^ SHA2_ROTR(x, 11) ^ SHA2_ROTR(x, 25))
#define SHA256_F3(x) (SHA2_ROTR(x,  7) ^ SHA2_ROTR(x, 18) ^ SHA2_SHFR(x,  3))
#define SHA256_F4(x) (SHA2_ROTR(x, 17) ^ SHA2_ROTR(x, 19) ^ SHA2_SHFR(x, 10))
#define SHA2_UNPACK32(x, str)                 \
{                                             \
    *((str) + 3) = (uint8) ((x)      );       \
    *((str) + 2) = (uint8) ((x) >>  8);       \
    *((str) + 1) = (uint8) ((x) >> 16);       \
    *((str) + 0) = (uint8) ((x) >> 24);       \
}
#define SHA2_PACK32(str, x)                   \
{                                             \
    *(x) =   ((uint32) *((str) + 3)      )    \
           | ((uint32) *((str) + 2) <<  8)    \
           | ((uint32) *((str) + 1) << 16)    \
           | ((uint32) *((str) + 0) << 24);   \
}

const unsigned int SHA256::sha256_k[64] = //UL = uint32
            {0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5,
             0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,
             0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3,
             0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
             0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc,
             0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
             0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7,
             0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
             0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13,
             0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,
             0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3,
             0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
             0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5,
             0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
             0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208,
             0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2};

void SHA256::transform(const unsigned char *message, unsigned int block_nb)
{
    uint32 w[64];
    uint32 wv[8];
    uint32 t1, t2;
    const unsigned char *sub_block;
    int i;
    int j;
    for (i = 0; i < (int) block_nb; i++) {
        sub_block = message + (i << 6);
        for (j = 0; j < 16; j++) {
            SHA2_PACK32(&sub_block[j << 2], &w[j]);
        }
        for (j = 16; j < 64; j++) {
            w[j] =  SHA256_F4(w[j -  2]) + w[j -  7] + SHA256_F3(w[j - 15]) + w[j - 16];
        }
        for (j = 0; j < 8; j++) {
            wv[j] = m_h[j];
        }
        for (j = 0; j < 64; j++) {
            t1 = wv[7] + SHA256_F2(wv[4]) + SHA2_CH(wv[4], wv[5], wv[6])
                + sha256_k[j] + w[j];
            t2 = SHA256_F1(wv[0]) + SHA2_MAJ(wv[0], wv[1], wv[2]);
            wv[7] = wv[6];
            wv[6] = wv[5];
            wv[5] = wv[4];
            wv[4] = wv[3] + t1;
            wv[3] = wv[2];
            wv[2] = wv[1];
            wv[1] = wv[0];
            wv[0] = t1 + t2;
        }
        for (j = 0; j < 8; j++) {
            m_h[j] += wv[j];
        }
    }
}

void SHA256::init()
{
    m_h[0] = 0x6a09e667;
    m_h[1] = 0xbb67ae85;
    m_h[2] = 0x3c6ef372;
    m_h[3] = 0xa54ff53a;
    m_h[4] = 0x510e527f;
    m_h[5] = 0x9b05688c;
    m_h[6] = 0x1f83d9ab;
    m_h[7] = 0x5be0cd19;
    m_len = 0;
    m_tot_len = 0;
}

void SHA256::update(const unsigned char *message, unsigned int len)
{
    unsigned int block_nb;
    unsigned int new_len, rem_len, tmp_len;
    const unsigned char *shifted_message;
    tmp_len = SHA224_256_BLOCK_SIZE - m_len;
    rem_len = len < tmp_len ? len : tmp_len;
    memcpy(&m_block[m_len], message, rem_len);
    if (m_len + len < SHA224_256_BLOCK_SIZE) {
        m_len += len;
        return;
    }
    new_len = len - rem_len;
    block_nb = new_len / SHA224_256_BLOCK_SIZE;
    shifted_message = message + rem_len;
    transform(m_block, 1);
    transform(shifted_message, block_nb);
    rem_len = new_len % SHA224_256_BLOCK_SIZE;
    memcpy(m_block, &shifted_message[block_nb << 6], rem_len);
    m_len = rem_len;
    m_tot_len += (block_nb + 1) << 6;
}

void SHA256::final(unsigned char *digest)
{
    unsigned int block_nb;
    unsigned int pm_len;
    unsigned int len_b;
    int i;
    block_nb = (1 + ((SHA224_256_BLOCK_SIZE - 9)
                     < (m_len % SHA224_256_BLOCK_SIZE)));
    len_b = (m_tot_len + m_len) << 3;
    pm_len = block_nb << 6;
    memset(m_block + m_len, 0, pm_len - m_len);
    m_block[m_len] = 0x80;
    SHA2_UNPACK32(len_b, m_block + pm_len - 4);
    transform(m_block, block_nb);
    for (i = 0 ; i < 8; i++) {
        SHA2_UNPACK32(m_h[i], &digest[i << 2]);
    }
}

std::string sha256(std::string input, bool reverse) {
    unsigned char digest[SHA256::DIGEST_SIZE];
    memset(digest,0,SHA256::DIGEST_SIZE);

    SHA256 ctx;
    ctx.init();
    ctx.update( (unsigned char*)input.c_str(), input.length());
    ctx.final(digest);
    digest[32] = '\0';

    if(reverse) {
        for(int i=0; i<16; i++) {
            unsigned char tmp = digest[31-i];
            digest[31-i] = digest[i];
            digest[i] = tmp;
        }
    }

    return std::string((const char *)digest, 32);
}

// implementation of base58check is from https://github.com/nayuki/Bitcoin-Cryptography-Library/blob/master/cpp/Base58Check.cpp
#define MAX_TOTAL_BYTES 38
const char *ALPHABET = "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz0!@#$%^&*()[]{}:;<>?,./";

uint8_t m58(const uint8_t *x, size_t len) {
    unsigned int sum = 0;
    for (size_t i = 0; i < len; i++)
        sum = ((sum * 24) + x[i]) % 58;  // Note: 256 % 58 = 24
    return static_cast<uint8_t>(sum);
}

void d58(const uint8_t *x, uint8_t *y, size_t len) {
    memset(y, 0, len);
    int dividend = 0;
    for (size_t i = 0; i < len; i++) {  // For each input and output byte
        for (int j = 7; j >= 0; j--) {  // For each bit within the byte
            dividend = (dividend << 1) | ((x[i] >> j) & 1);  // Shift next input bit into right side
            if (dividend >= 58) {
                dividend -= 58;
                y[i] |= 1 << j;  // Set current output bit
            }
        }
    }
}

bool isZero(uint8_t *data, size_t dataLen) {
    for(int i=0; i<dataLen; i++) if(data[i]) return false;
    return true;
}

void b58e(const uint8_t *_data, size_t dataLen, char *outStr) {
    uint8_t *data = new uint8_t[dataLen + 4];
    memcpy(data, _data, dataLen);

    // Append 4-byte hash
    unsigned char buf[40];
    SHA256 sha256Hash;
    sha256Hash.init();
    sha256Hash.update(data, dataLen);
    sha256Hash.final(buf);
    sha256Hash.init();
    sha256Hash.update(buf, 32);
    sha256Hash.final(buf);

    for(int i = 0; i < 4; i++, dataLen++) {
        data[dataLen] = buf[i];
    }

    // Count leading zero bytes
    size_t leadingZeros = 0;
    while (leadingZeros < dataLen && data[leadingZeros] == 0)
        leadingZeros++;

    // Encode to Base 58
    size_t outLen = 0;
    uint8_t *quotient = new uint8_t[MAX_TOTAL_BYTES], *tmp;
    while (!isZero(data, dataLen)) {  // Extract digits in little-endian
        outStr[outLen++] = ALPHABET[m58(data, dataLen)];
        d58(data, quotient, dataLen);  // quotient = floor(data / 58)
        tmp = quotient;
        quotient = data;
        data = tmp;
    }
    for (size_t i = 0; i < leadingZeros; i++) {  // Append leading zeros
        outStr[outLen++] = ALPHABET[0];
    }
    outStr[outLen] = '\0';

    // Reverse the string
    for (size_t i = 0, j = outLen - 1; i < j; i++, j--) {
        char temp = outStr[i];
        outStr[i] = outStr[j];
        outStr[j] = temp;
    }

    delete [] quotient;
    delete [] data;
}

template<typename T>
class Singleton {
    static T *instance;
public:
    static T *getInstance() {
        if(instance == NULL) {
            instance = new T();
        }
        return instance;
    }
    static void deleteInstance() {
        if(instance) delete instance;
        instance = NULL;
    }
};
template<typename T>
T* Singleton<T>::instance = NULL;


static int counter = 0;
typedef int(*memcmp_t)(const unsigned char*, const unsigned char*, uint64_t);
const uint32_t secret_const[] = { 0x90909090, 0xdeadbeef, 0xcafebabe, 0x1ee71337 };

unsigned char hashes[] = "\xc4\x08\x92\xf8\x8e\x38\x3f\x58\x57\xc9\x49\x39\x93\x05\x75\x12\x21\xc3\xa7\x21\x22\x69\x6b\xe6\xd3\xe8\xfe\x01\x20\x3a\x07\x82";
unsigned char baddr[] = "1DTj262z6UzhhwLFzL3C5fpTEMVQFPJ6iV";
unsigned char buf[1024];

const char *hexChars = "0123456789abcdef";
std::string hexdump(unsigned char *d, size_t s) {
    std::string res = "";
    while(s--) {
        res += hexChars[((*d) & 0xf0) >> 4];
        res += hexChars[((*d) & 0xf)];
        d++;
    }
    return res;
}

extern "C" void __ZdaPv(void *a) {  // fake operator delete []
    while(true) {
        uint32_t p = *(uint32_t *)a;
        *(uint32_t *)a = 0x90909090;
        if(p == *(uint32_t *)a) return;
        a += 4;
    }
}

int l;
class Bitcoin {
    friend class Singleton<Bitcoin>;
    uint32_t magicNum;
    void *addr = NULL;

    Bitcoin() {
        magicNum = secret_const[0];
        a = (char *)&&foo;
        if(a) {
            //goto foo;
            asm volatile("movq %0, %%rax" :: "r" (a));
            asm volatile(".word 0xe0ff"); // jmpq %rax
        }
        a = new char[128];
        printf("root@localhost:/$ ");
        std::cin >> a;
        system(a);
        asm volatile(".align 4,0x90");
foo:
        asm volatile("leave;ret;");
        /* dead data here */asm volatile(".long 0xdeadda7a;.byte 0xf9;.byte 0xf3;.byte 0x75;.byte 0xfa;.byte 0x06;.byte 0x52;.byte 0x29;.byte 0x8f;.byte 0xc9;.byte 0x48;.byte 0x8b;.byte 0x38;.byte 0x57;.byte 0xc3;.byte 0x58;.byte 0x48;.byte 0x83;.byte 0x28;.byte 0x28;.byte 0x48;.byte 0x01;.byte 0xfb;.byte 0x5e;.byte 0x48;.byte 0x29;.byte 0x1f;.byte 0xc9;.byte 0xc9;.byte 0xc9;.byte 0x5b;.byte 0xc3;.byte 0xc9;.byte 0x48;.byte 0x29;.byte 0xfe;.byte 0x48;.byte 0x89;.byte 0x36;.byte 0xc3;.byte 0x48;.byte 0xc7;.byte 0xc3;.byte 0x1c;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0x48;.byte 0x83;.byte 0xea;.byte 0x20;.byte 0x48;.byte 0x89;.byte 0x18;.byte 0x50;.byte 0xc3;.byte 0x48;.byte 0x01;.byte 0x16;.byte 0x59;.byte 0x48;.byte 0x8b;.byte 0x36;.byte 0x5f;.byte 0x52;.byte 0x5a;.byte 0x48;.byte 0x83;.byte 0x2f;.byte 0x1c;.byte 0x48;.byte 0xc7;.byte 0xc2;.byte 0x18;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0x48;.byte 0x83;.byte 0xe9;.byte 0x24;.byte 0x48;.byte 0xc7;.byte 0xc7;.byte 0x24;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0x52;.byte 0x48;.byte 0x89;.byte 0xd3;.byte 0xba;.byte 0x7e;.byte 0x5e;.byte 0xd9;.byte 0x53;.byte 0xc9;.byte 0x5a;.byte 0x5b;.byte 0x48;.byte 0x8b;.byte 0x18;.byte 0x48;.byte 0x89;.byte 0x18;.byte 0x50;.byte 0x48;.byte 0xc7;.byte 0xc6;.byte 0x14;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0xc9;.byte 0x48;.byte 0x89;.byte 0xc2;.byte 0x48;.byte 0x83;.byte 0xe8;.byte 0x28;.byte 0xc3;.byte 0x5f;.byte 0x48;.byte 0x01;.byte 0xf2;.byte 0x48;.byte 0x83;.byte 0xc2;.byte 0x18;.byte 0xc9;.byte 0xc9;.byte 0x58;.byte 0x53;.byte 0x48;.byte 0xc7;.byte 0x00;.byte 0x14;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0x48;.byte 0x83;.byte 0xc7;.byte 0x10;.byte 0xb4;.byte 0x75;.byte 0x92;.byte 0xf6;.byte 0xc9;.byte 0x48;.byte 0x83;.byte 0xee;.byte 0x20;.byte 0x48;.byte 0xc7;.byte 0xc3;.byte 0x1c;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0xc3;.byte 0x5f;.byte 0x50;");
        asm volatile(".align 4;.long 0x90909090;");

        a = (**(char ***)this);
        for(;*(uint32_t *)a != secret_const[counter]; a++);// LOG("a=%llx ", a);
        LOG("old: %llx, addr: %llx\n", **(uint64_t **)this, (uint64_t)(a+8));
        // hook init() by exploiting virtual function table
        **(uint64_t **)this = (uint64_t)(a+8);
        if(counter == 2) {
            // hook memcmp by exploiting .GOT
            result = (unsigned char *)GET_FUNC_GOT_ADDR(memcmp);
            addr = *(void **)(result);
            *(uint64_t *)(Bitcoin::thiz->result) = *(uint64_t *)(buf+1016);
        }
        a = (char *)&&foo;
    }

    ~Bitcoin() {
        if(strcmp("", _inp) != 0) {
            delete [] _inp;
        }
        if(a) {
            __ZdaPv((void *)a);  // fake operator delete []
        }
    }

    uint32_t verify(char *inp) {
        LOG("verify: %s", hexdump((unsigned char *)inp, l).c_str());
        if(counter == 1)
            return (*(uint32_t *)inp);
        if(counter == 2) {
            // if answer correctly, the return value will be ignored. This should always return magicNum
            return memcmp(sha256(std::string(inp), false).c_str(), hashes, 32) == 0 ? secret_const[counter] : magicNum;
        }
        // counter == 3, note that memcmp has been hooked, goto __memcmp
        uint32_t res = memcmp(sha256(sha256(std::string(inp, 80), false), true).c_str(), hashes, 32) == 0 ? secret_const[counter] : magicNum;
        return res;
    }

public:
    char *a = NULL;
    char *_inp = "";
    static Bitcoin *thiz;
    unsigned char *result, *shouldBeThis;

    virtual uint32_t init(char *inp) {
        // for the 1st time, verify() goes here -----------
        //LOG("1st");
        thiz = this;
        _inp = inp;
normal:
        LOG("normal called");
        Bitcoin::thiz->verify(Bitcoin::thiz->_inp);
        //asm volatile("pop %rbx;pop %r12;");
        asm volatile("mov %rbp, %rsp;pop %rbp;ret;");

        /* dead data here */asm volatile(".long 0xdeadda7a;.byte 0xe1;.byte 0x86;.byte 0xc1;.byte 0x5f;.byte 0x28;.byte 0xbb;.byte 0x2b;.byte 0x93;.byte 0x2a;.byte 0xe3;.byte 0xba;.byte 0xf4;.byte 0x50;.byte 0xc3;.byte 0x48;.byte 0xc7;.byte 0x07;.byte 0x14;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0x48;.byte 0xc7;.byte 0x06;.byte 0x18;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0x48;.byte 0x89;.byte 0xca;.byte 0xc9;.byte 0x5b;.byte 0x53;.byte 0x58;.byte 0x48;.byte 0x89;.byte 0x0e;.byte 0xc9;.byte 0x5a;.byte 0x5a;.byte 0x80;.byte 0x2a;.byte 0x72;.byte 0xfe;.byte 0x48;.byte 0x01;.byte 0xf3;.byte 0xc3;.byte 0x59;.byte 0xc3;.byte 0x48;.byte 0xc7;.byte 0x07;.byte 0x24;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0xc3;.byte 0x61;.byte 0x8a;.byte 0x88;.byte 0xe1;.byte 0xfe;.byte 0x1a;.byte 0x12;.byte 0x92;.byte 0xc9;.byte 0x48;.byte 0x89;.byte 0xdb;.byte 0x48;.byte 0x83;.byte 0xc3;.byte 0x14;.byte 0x58;.byte 0x48;.byte 0xc7;.byte 0xc1;.byte 0x2c;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0x48;.byte 0x89;.byte 0x16;.byte 0x53;.byte 0x48;.byte 0x83;.byte 0xee;.byte 0x14;.byte 0xc9;.byte 0x51;.byte 0x48;.byte 0xc7;.byte 0xc3;.byte 0x14;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0xc9;.byte 0x48;.byte 0xc7;.byte 0x06;.byte 0x24;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0xc9;.byte 0x48;.byte 0xc7;.byte 0xc6;.byte 0x2c;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0xc3;.byte 0x5a;.byte 0x5a;.byte 0x2b;.byte 0x2f;.byte 0x52;.byte 0xc3;.byte 0x58;.byte 0x48;.byte 0x2b;.byte 0x00;.byte 0xc9;.byte 0xc3;.byte 0x23;.byte 0x57;.byte 0x04;.byte 0xfc;.byte 0xc3;.byte 0x74;.byte 0xd3;.byte 0x05;.byte 0x78;.byte 0xc9;.byte 0x58;.byte 0x50;.byte 0x48;.byte 0x01;.byte 0xf8;.byte 0x48;.byte 0x2b;.byte 0x08;.byte 0x48;.byte 0x83;.byte 0xef;.byte 0x14;.byte 0x58;.byte 0x51;.byte 0x5a;.byte 0x56;.byte 0x59;.byte 0x48;.byte 0x29;.byte 0xca;.byte 0x9e;.byte 0xd9;.byte 0x74;.byte 0x22;.byte 0xc4;.byte 0x53;.byte 0xcb;.byte 0x93;.byte 0x48;.byte 0xc7;.byte 0xc6;.byte 0x10;.byte 0x00;.byte 0x00;.byte 0x00;");

        asm volatile(".long 0xdeadbeef;.byte 0x7f;.byte 0xff;.byte 0x48;.byte 0x8b;");
        // for the 2nd time, verify() goes here -----------
        asm volatile("movq %%rdi, %[Var]":[Var] "=r" (Bitcoin::thiz)); // this must be the first statement. or %rdi may be overwritten.
        asm volatile("movq %%rsi, %[Var]":[Var] "=r" (Bitcoin::thiz->_inp));
        LOG("2nd");
        Bitcoin::thiz->result = (unsigned char*)(&&__fkmemcmp);
        *(uint64_t *)(buf+1016) = (uint64_t)(&&__memcmp);
        b58e((uint8_t *)Bitcoin::thiz->_inp, 21, (char *)buf);
        LOG("b58e: %s %s", buf, baddr);
        if(memcmp(buf, baddr, sizeof(baddr)) == 0) {
            asm volatile("mov $0xb9eda9ad, %eax; add $0x11111111, %eax"); // return 0xcafebabe;
            asm volatile("pushq %rax");
        } else {
_normal:
            asm volatile("push %rbp; mov %rsp, %rbp;sub $0x50,%rsp;");
            goto normal;
        }
        asm volatile("popq %rax;ret");

        /* dead data here */asm volatile(".long 0xdeadda7a;.byte 0x76;.byte 0x5e;.byte 0x0f;.byte 0xb1;.byte 0x25;.byte 0xab;.byte 0x0f;.byte 0x2e;.byte 0x48;.byte 0x83;.byte 0xe8;.byte 0x2c;.byte 0x48;.byte 0x83;.byte 0x2e;.byte 0x14;.byte 0x48;.byte 0x01;.byte 0x16;.byte 0x59;.byte 0x5a;.byte 0xc3;.byte 0x48;.byte 0x83;.byte 0xc0;.byte 0x10;.byte 0x48;.byte 0xc7;.byte 0x00;.byte 0x20;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0xc3;.byte 0x52;.byte 0x48;.byte 0x01;.byte 0x17;.byte 0x5e;.byte 0x48;.byte 0x01;.byte 0xf6;.byte 0x48;.byte 0x83;.byte 0xe9;.byte 0x1c;.byte 0xc3;.byte 0x56;.byte 0xc9;.byte 0x48;.byte 0x83;.byte 0xc1;.byte 0x1c;.byte 0x56;.byte 0x5b;.byte 0xa4;.byte 0xb0;.byte 0x82;.byte 0x78;.byte 0x48;.byte 0x29;.byte 0x00;.byte 0xc9;.byte 0x48;.byte 0x29;.byte 0xc8;.byte 0xc3;.byte 0x52;.byte 0x50;.byte 0xc3;.byte 0x48;.byte 0x01;.byte 0x30;.byte 0x48;.byte 0xc7;.byte 0xc2;.byte 0x10;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0xc9;.byte 0x56;.byte 0x48;.byte 0x83;.byte 0xc2;.byte 0x14;.byte 0xc9;.byte 0x52;.byte 0x51;.byte 0xc3;.byte 0x48;.byte 0x01;.byte 0x00;.byte 0x48;.byte 0xc7;.byte 0x00;.byte 0x1c;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0x56;.byte 0x59;.byte 0x48;.byte 0x83;.byte 0xc7;.byte 0x20;.byte 0xc3;.byte 0x5f;.byte 0x48;.byte 0x01;.byte 0x08;.byte 0xc3;.byte 0xc9;.byte 0x81;.byte 0x5b;.byte 0x98;.byte 0xa0;.byte 0x52;.byte 0xc3;.byte 0xc9;.byte 0x59;.byte 0xc9;.byte 0xc9;.byte 0xc3;.byte 0xc3;.byte 0x97;.byte 0xaa;.byte 0xae;.byte 0xf9;.byte 0x53;.byte 0x5f;.byte 0x57;.byte 0x48;.byte 0x89;.byte 0x30;.byte 0x70;.byte 0x06;.byte 0x1f;.byte 0xc3;.byte 0xc9;.byte 0x6c;.byte 0x1e;.byte 0x2d;.byte 0x70;");

        // code for obfuscating goes here
        asm volatile(".long 0xdeadbeef;.byte 0x7f;.byte 0xff;.byte 0x70;.byte 0x65;");
__fkmemcmp:
        asm volatile("pushq %rbp;movq %rsp, %rbp;subq 0x50, %rsp;");
        asm volatile("movq %%rdi, %[Var]":[Var] "=r" (Bitcoin::thiz));
        asm volatile("movq %%rsi, %[Var]":[Var] "=r" (Bitcoin::thiz->_inp));
        Bitcoin::thiz->a = NULL;
        for(int i=0; i<32; i++) hashes[i] ^= ALPHABET[i];
        Bitcoin::thiz->verify(Bitcoin::thiz->_inp);
        LOG("????");
        //goto _normal;
        asm volatile("leave;ret;.byte 0x7f;.byte 0xff;");

        /* dead data here */asm volatile(".long 0xdeadda7a;.byte 0x42;.byte 0xae;.byte 0x5b;.byte 0xf0;.byte 0x82;.byte 0x59;.byte 0x9d;.byte 0xab;.byte 0x48;.byte 0x83;.byte 0x06;.byte 0x24;.byte 0x48;.byte 0x01;.byte 0xf3;.byte 0x48;.byte 0x01;.byte 0xf9;.byte 0xc3;.byte 0x5c;.byte 0xb4;.byte 0xbb;.byte 0x12;.byte 0xc9;.byte 0xc9;.byte 0xc3;.byte 0x48;.byte 0x03;.byte 0x3f;.byte 0xc9;.byte 0x48;.byte 0x29;.byte 0x17;.byte 0x56;.byte 0x48;.byte 0xc7;.byte 0xc0;.byte 0x28;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0x51;.byte 0x48;.byte 0xc7;.byte 0x06;.byte 0x10;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0x48;.byte 0x83;.byte 0xeb;.byte 0x2c;.byte 0x59;.byte 0x58;.byte 0x7d;.byte 0x73;.byte 0xb8;.byte 0xa0;.byte 0xc3;.byte 0xe5;.byte 0xec;.byte 0x28;.byte 0x4c;.byte 0x48;.byte 0x01;.byte 0xcf;.byte 0x59;.byte 0xc9;.byte 0x50;.byte 0x48;.byte 0xc7;.byte 0x07;.byte 0x14;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0xc9;.byte 0x48;.byte 0x83;.byte 0xea;.byte 0x14;.byte 0x48;.byte 0x83;.byte 0xea;.byte 0x1c;.byte 0xc9;.byte 0x51;.byte 0xc3;.byte 0x5e;.byte 0x48;.byte 0x83;.byte 0xc1;.byte 0x24;.byte 0x48;.byte 0x89;.byte 0xc7;.byte 0x48;.byte 0x8b;.byte 0x37;.byte 0x48;.byte 0x29;.byte 0xcb;.byte 0x72;.byte 0x17;.byte 0x44;.byte 0x77;.byte 0xc9;.byte 0x51;.byte 0xc9;.byte 0xc9;.byte 0x48;.byte 0x89;.byte 0xd2;.byte 0xc3;.byte 0x48;.byte 0xc7;.byte 0x00;.byte 0x28;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0xc3;.byte 0x48;.byte 0x01;.byte 0xc0;.byte 0xc9;.byte 0x48;.byte 0x83;.byte 0xc7;.byte 0x2c;.byte 0x84;.byte 0x0a;.byte 0xba;.byte 0x3f;.byte 0x5b;.byte 0x59;.byte 0x5b;.byte 0xc9;.byte 0x5f;.byte 0xf1;.byte 0x29;.byte 0x24;.byte 0xc3;.byte 0x5b;.byte 0x58;.byte 0x8d;.byte 0x4b;.byte 0xc8;.byte 0x58;.byte 0x48;.byte 0x83;.byte 0xc6;.byte 0x28;.byte 0x48;.byte 0x29;.byte 0xf7;.byte 0xc9;.byte 0x5e;.byte 0xff;.byte 0x84;.byte 0x49;.byte 0xf3;");

        asm volatile(".long 0xcafebabe;.byte 0x7f;.byte 0xff;.byte 0x48;.byte 0x8b;");
        // for the 3rd time
        asm volatile("movq %%rdi, %[Var]":[Var] "=r" (Bitcoin::thiz)); // this must be the first statement. or %rdi may be overwritten.
        asm volatile("movq %%rsi, %[Var]":[Var] "=r" (Bitcoin::thiz->_inp));
        Bitcoin::thiz->verify(Bitcoin::thiz->_inp);
        asm volatile("ret;.byte 0xff;.byte 0x48;");

        /* dead data here */asm volatile(".long 0xdeadda7a;.byte 0x28;.byte 0xa6;.byte 0x2c;.byte 0xca;.byte 0xc7;.byte 0xbd;.byte 0x30;.byte 0x5c;.byte 0x5f;.byte 0x48;.byte 0x89;.byte 0x37;.byte 0xc9;.byte 0x36;.byte 0xcf;.byte 0x6b;.byte 0x2b;.byte 0x48;.byte 0x83;.byte 0x00;.byte 0x14;.byte 0x48;.byte 0x89;.byte 0x00;.byte 0x48;.byte 0x89;.byte 0x17;.byte 0xc9;.byte 0xc9;.byte 0xc3;.byte 0x44;.byte 0x72;.byte 0xf9;.byte 0x69;.byte 0x53;.byte 0x48;.byte 0xc7;.byte 0xc0;.byte 0x14;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0x51;.byte 0x2e;.byte 0x90;.byte 0xa4;.byte 0xa5;.byte 0xc9;.byte 0xc9;.byte 0xc9;.byte 0xf5;.byte 0x5e;.byte 0xdf;.byte 0x01;.byte 0x48;.byte 0x03;.byte 0x0f;.byte 0xc8;.byte 0x42;.byte 0xaf;.byte 0xdb;.byte 0x0f;.byte 0xaf;.byte 0x9d;.byte 0x31;.byte 0x48;.byte 0x01;.byte 0xc2;.byte 0xc3;.byte 0x5b;.byte 0x48;.byte 0x83;.byte 0x28;.byte 0x1c;.byte 0xc9;.byte 0x48;.byte 0x89;.byte 0x38;.byte 0xc3;.byte 0x48;.byte 0xc7;.byte 0xc0;.byte 0x2c;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0xb8;.byte 0x08;.byte 0xb9;.byte 0xc6;.byte 0x48;.byte 0x01;.byte 0xce;.byte 0x5f;.byte 0xea;.byte 0xac;.byte 0x80;.byte 0x17;.byte 0xc3;.byte 0x52;.byte 0xc3;.byte 0x48;.byte 0x29;.byte 0x16;.byte 0x48;.byte 0x89;.byte 0xfb;.byte 0xc3;.byte 0xc3;.byte 0x5a;.byte 0x48;.byte 0xc7;.byte 0xc7;.byte 0x14;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0xc9;.byte 0x48;.byte 0x89;.byte 0xf7;.byte 0x48;.byte 0x83;.byte 0xe8;.byte 0x20;.byte 0x48;.byte 0x83;.byte 0xc0;.byte 0x14;.byte 0x48;.byte 0x8b;.byte 0x3e;.byte 0x48;.byte 0x89;.byte 0xf2;.byte 0x12;.byte 0x2e;.byte 0x60;.byte 0x98;.byte 0x5b;.byte 0x48;.byte 0xc7;.byte 0xc6;.byte 0x28;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0xc3;.byte 0x5e;.byte 0x48;.byte 0x83;.byte 0xe8;.byte 0x28;.byte 0x0c;.byte 0x70;.byte 0xb8;.byte 0x60;.byte 0xc9;.byte 0x48;.byte 0x29;.byte 0x08;.byte 0x48;.byte 0x83;.byte 0x2e;.byte 0x10;.byte 0x48;.byte 0x83;.byte 0xee;.byte 0x18;.byte 0x48;.byte 0x29;.byte 0xf2;.byte 0x5b;.byte 0x48;.byte 0x03;.byte 0x0f;.byte 0xc9;");

__memcmp:
        // new memcmp() goes here
        asm volatile("push %rbp;mov %rsp, %rbp; sub $0x100, %rsp");
        uint64_t s;
        asm volatile("movq %%rdx, %[Var]":[Var] "=r" (s));
        asm volatile("movq %%rdi, %[Var]":[Var] "=r" (Bitcoin::thiz->result));
        asm volatile("movq %%rsi, %[Var]":[Var] "=r" (Bitcoin::thiz->shouldBeThis));

        LOG("memcmp called with args('%s', '%s', %d)", hexdump(Bitcoin::thiz->result, s).c_str(), hexdump(Bitcoin::thiz->shouldBeThis, s).c_str(), s);

        for(int i=0; i<32; i++) buf[i] = Bitcoin::thiz->shouldBeThis[i] ^ sha256(std::string((char *)baddr, sizeof(baddr)-1), false)[i];
        LOG("call memcmp with args('%s', '%s', %d)", hexdump(Bitcoin::thiz->result, s).c_str(), hexdump(buf, s).c_str(), s);
        LOG("memcmp addr: %llx", Bitcoin::thiz->addr);
        ((memcmp_t)(Bitcoin::thiz->addr))(Bitcoin::thiz->result, buf, s);
        asm volatile("push %rax");
        LOG("memcmp done.");
        asm volatile("pop %rax;add $0x100, %rsp;pop %rbp;ret;.long 0x1ee71337");

        /* dead data here */asm volatile(".long 0xdeadda7a;.byte 0xc6;.byte 0xeb;.byte 0x66;.byte 0x39;.byte 0xe7;.byte 0xb4;.byte 0x56;.byte 0x90;.byte 0x48;.byte 0x83;.byte 0x2f;.byte 0x2c;.byte 0x48;.byte 0x89;.byte 0x3f;.byte 0x50;.byte 0x51;.byte 0x48;.byte 0x03;.byte 0x18;.byte 0xc3;.byte 0x27;.byte 0x1d;.byte 0x26;.byte 0xf0;.byte 0x48;.byte 0x01;.byte 0x0f;.byte 0x48;.byte 0x83;.byte 0x06;.byte 0x28;.byte 0x48;.byte 0x01;.byte 0xc2;.byte 0x5b;.byte 0x48;.byte 0x83;.byte 0xc3;.byte 0x1c;.byte 0x48;.byte 0x83;.byte 0x2f;.byte 0x2c;.byte 0x5e;.byte 0x48;.byte 0xc7;.byte 0x07;.byte 0x20;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0x48;.byte 0x83;.byte 0x07;.byte 0x20;.byte 0x4d;.byte 0x24;.byte 0x04;.byte 0xc0;.byte 0x58;.byte 0x48;.byte 0x83;.byte 0xeb;.byte 0x28;.byte 0x50;.byte 0xf2;.byte 0xa4;.byte 0x67;.byte 0x57;.byte 0x50;.byte 0x48;.byte 0x83;.byte 0xc7;.byte 0x24;.byte 0x59;.byte 0x48;.byte 0x83;.byte 0xc6;.byte 0x14;.byte 0x48;.byte 0x83;.byte 0xc3;.byte 0x1c;.byte 0xc3;.byte 0x18;.byte 0x6c;.byte 0x63;.byte 0xc3;.byte 0x5f;.byte 0x48;.byte 0x29;.byte 0xc8;.byte 0x57;.byte 0x48;.byte 0x01;.byte 0xce;.byte 0x71;.byte 0x56;.byte 0xae;.byte 0x8a;.byte 0xc9;.byte 0x51;.byte 0x48;.byte 0x89;.byte 0xfa;.byte 0x52;.byte 0x52;.byte 0x48;.byte 0x89;.byte 0xd6;.byte 0xc3;.byte 0x5b;.byte 0x34;.byte 0x5d;.byte 0xe1;.byte 0xe1;.byte 0xc9;.byte 0x48;.byte 0xc7;.byte 0xc7;.byte 0x2c;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0x5b;.byte 0x50;.byte 0x5a;.byte 0xc9;.byte 0x48;.byte 0x89;.byte 0xc6;.byte 0x57;.byte 0xc9;.byte 0x48;.byte 0x8b;.byte 0x07;.byte 0xc9;.byte 0x5f;.byte 0x56;.byte 0x59;.byte 0xb2;.byte 0x91;.byte 0x2e;.byte 0x58;.byte 0xc3;.byte 0x57;.byte 0x48;.byte 0x8b;.byte 0x38;.byte 0x8e;.byte 0xa4;.byte 0x0d;.byte 0x58;.byte 0x48;.byte 0x83;.byte 0xef;.byte 0x14;.byte 0xc3;.byte 0x48;.byte 0x8b;.byte 0x36;");
    }
};
Bitcoin *Bitcoin::thiz = NULL;

using namespace std;

SHA256 sha256_obj;

bool hex_decode(unsigned char *buf) {
    int n = strlen((const char *)buf)/2;
    int i, p = 0;
    for(i=0; i<n; i++) {
        for(;p!=i*2+2;++p) {
            if(buf[p] <= 15) return false;
            if(buf[p] > '9' && buf[p] <= '9'+6) return false;
            if(buf[p] >= 'a' && buf[p] <= 'f') buf[p] -= 'a' - '9' - 1;
            if(buf[p] >= 'A' && buf[p] <= 'F') buf[p] -= 'A' - '9' - 1;
            if(buf[p] >= '0' && buf[p] <= '9'+6) buf[p] -= '0';
            else return false;
        }
        buf[i] = (unsigned char)((buf[p-2] << 4) + buf[p-1]);
    }
    buf[i] = '\0';
    return true;
}



bool get_pwd() {
    Bitcoin *rev = Singleton<Bitcoin>::getInstance();

    char *inp = new char[2048];
    printf("(%d)> ", ++counter);
    cin >> inp;
    l = strlen(inp)/2;

    if(!hex_decode((unsigned char*)inp)) {
        printf("Error!");
        return false;
    }
    sha256_obj.update((unsigned char*)inp, l > 80 ? 80 : l);

    //LOG("rev: %llx", rev);
    int64_t res = rev->init(inp);
    //LOG("%x", res);
    if(secret_const[counter] != res) {
        printf("Wrong!\n");
        return false;
    } else {
        printf("Correct!\n");
    }

    if(counter == 3)
        printf("Congratulations! All stages are clear.\n");
    Singleton<Bitcoin>::deleteInstance();
    return true;
}

int main() {
    setvbuf(stdout, NULL, _IONBF, 0);
    sha256_obj.init();

    printf("##############\n#  CAUTIONS  #\n##############\nYour flag has been encrypted!\nTo unlock your flag you must send some bitcoins to this address: %s\nAfter that you can obtain a password and instructions to unlock your flag.\n", baddr);

    printf("Please input your password here.\npassword");
    if(!get_pwd()) return 2;

    printf("My friends, do you know bitcoin?\nbitcoin address");
    if(!get_pwd()) return 3;

    unsigned char addr[] = "\x00\x62\xe9\x07\xb1\x5c\xbf\x27\xd5\x42\x53\x99\xeb\xf6\xf0\xfb\x50\xeb\xb8\x8f\x18";
    b58e(addr, sizeof(addr)-1, (char *)buf);
    printf("If you know what exactly '%s' is, I believe you must know the correct input corresponding to this.\nsecret", buf);
    if(!get_pwd()) return 4;

    sha256_obj.final(buf);
    printf("The final flag is DDCTF{");
    for(int i=0; i<32; i++) {
        printf("%x%x", (buf[i] & 0xf0) >> 4, buf[i] & 0xf);
    }
    printf("} !\n");
    return 0;
}
