// written in C++14 by garzon
// $ g++ -std=c++14 -O0 obfuscating_macros.cpp && strip a.out && mv a.out obfuscating_macros.out

//#define DISABLE_OBF // if used, only plain c++ code will be compiled
//#define DEBUG_CODE // used to check the pre-generated c++ code only and will not compile

//#define PRINT_FLAG_ONLY // used to print the flag

#ifndef DISABLE_OBF

// a marker for useless(obfuscating) code, w. or w/o. code inside will not affect the logic
#define _USELESS_CODE(...) __VA_ARGS__

_USELESS_CODE(
	constexpr int myXorConst = 0x75bf8a0d;//0x5f8b712a;

	template<int n>
	struct ConstInt {
		static constexpr int encoder() {
			constexpr int i = n + 2;
			return i ^ myXorConst;
		}
		static constexpr int encoded = encoder();
	};

	inline int ConstInt_decoder(const int n) {
		return (n^myXorConst)-2;
	}
)

#define _OBF_CONST(c) _USELESS_CODE(ConstInt_decoder) ( _USELESS_CODE(ConstInt<) c _USELESS_CODE(>::encoded) )

#define _GOTO_EXECUTE_FSM _USELESS_CODE(if (!__is_executing)) goto *__goto_labels[__exec_fsm_id]
#define _GOTO_BLOCK(id) if (!__curr__STATE) __curr__STATE = id; _GOTO_EXECUTE_FSM
#define _STATE(id) st_ ## id
#define _FUNCTION_START(dummy, id, retVal) { auto &__retVal = (retVal); size_t __curr__STATE = 0, __else_block = 0, __is_executing = dummy & 0, __exec_fsm_id; std::unordered_map<size_t, void *> __goto_labels; void *__nxt_ptr; constexpr size_t __fsm_entry_id = id; __goto_labels[id] = &&_STATE(id); if (__is_executing) { _STATE(id):
#define FUNCTION_START(retVal)    _FUNCTION_START(__COUNTER__, __COUNTER__, retVal)
#define _FUNCTION_END(id, id2) goto *__goto_labels[0]; } /*__is_executing++;*/ __exec_fsm_id = id; __goto_labels[id]=&&_STATE(id); __goto_labels[0]=&&_STATE(id2); goto *__goto_labels[__fsm_entry_id]; _STATE(id): __nxt_ptr = __goto_labels[__curr__STATE]; __curr__STATE = 0; goto *__nxt_ptr; _STATE(id2):; }
#define FUNCTION_END      _FUNCTION_END(__COUNTER__, __COUNTER__)
#define RETURN(...)       __retVal = (__VA_ARGS__); goto *__goto_labels[0]
#define _MAKE_BLOCK_WITH_OID(oid, id, id2, ...) _GOTO_BLOCK(id2); } __goto_labels[oid] = &&_STATE(id); __goto_labels[_OBF_CONST(id2)] = &&_STATE(id2); if (__is_executing) { _STATE(id): __VA_ARGS__; } if (__is_executing) { _STATE(id2): 
#define _MAKE_BLOCK(id, id2, ...) _MAKE_BLOCK_WITH_OID(id, id, id2, __VA_ARGS__)
#define _BLOCK_WITH_NAME(id, name, ...) _GOTO_BLOCK(id); } __goto_labels[_OBF_CONST(id)] = &&_STATE(name); if (__is_executing) { _STATE(name): __VA_ARGS__;
#define _BLOCK(id, ...) _BLOCK_WITH_NAME(id, id, __VA_ARGS__)
#define BLOCK(...) _BLOCK(__COUNTER__, __VA_ARGS__)
//#define BLOCK_WITH_NAME(name, ...) _BLOCK_WITH_NAME(__COUNTER__, name, __VA_ARGS__) BLOCK();
#define MAKE_BLOCK_WITH_NAME(name, ...) _MAKE_BLOCK_WITH_OID(__COUNTER__, name, __COUNTER__, __VA_ARGS__; _GOTO_EXECUTE_FSM)
#define _INCLUDE_BLOCK(name, id1) __curr__STATE = id1; goto name; _BLOCK_WITH_NAME(id1, id1, )
#define INCLUDE_BLOCK(name) _INCLUDE_BLOCK(_STATE(name), __COUNTER__)
//#define INCLUDE_BLOCK_POINTER(block_ptr) _INCLUDE_BLOCK(*(block_ptr), __COUNTER__)
#define GET_BLOCK_POINTER(name) (&&_STATE(name))

#define _IF(expr, id, id2, id3, id4, ...) _MAKE_BLOCK(id, id2, __VA_ARGS__; _GOTO_BLOCK(id3)) _GOTO_BLOCK(id4); _MAKE_BLOCK(id4, id3, size_t __tmp = id3; if (expr) { __tmp -= 2; static_assert(id3 - 2 == id, "IF block id not match"); } _GOTO_BLOCK(__tmp))
#define IF(expr, ...) _IF(expr, __COUNTER__, __COUNTER__, __COUNTER__, __COUNTER__, __VA_ARGS__)
	
#define _WHILE(expr, id, id2, id3, id4, ...) _MAKE_BLOCK(id, id2, __VA_ARGS__; _GOTO_BLOCK(id3)) _GOTO_BLOCK(id3); _MAKE_BLOCK(id3, id4, size_t __tmp = id4; if (expr) { __tmp -= 3; static_assert(id4 - 3 == id, "WHILE block id not match"); } _GOTO_BLOCK(__tmp))
#define WHILE(expr, ...) _WHILE(expr, __COUNTER__, __COUNTER__, __COUNTER__, __COUNTER__, __VA_ARGS__)
#define FOR(init, cond, end, ...) BLOCK(init); _WHILE(cond, __COUNTER__, __COUNTER__, __COUNTER__, __COUNTER__, __VA_ARGS__; end)

#define _IF_ELSE(expr, id, id2, id3, id4, id5, ...) _MAKE_BLOCK(id, id2, __VA_ARGS__; _GOTO_BLOCK(id3)) _GOTO_BLOCK(id4); _MAKE_BLOCK(id4, id3, size_t __tmp = id5; if (expr) { __tmp -= 4; } static_assert(id5 - 4 == id, "IF_ELSE block id not match"); _GOTO_BLOCK(__tmp); _USELESS_CODE(__else_block+=2;) } _USELESS_CODE(else) { __else_block = id5 )
#define IF_ELSE(expr, ...) _IF_ELSE(expr, __COUNTER__, __COUNTER__, __COUNTER__, __COUNTER__, __COUNTER__, __VA_ARGS__)

#define _ELSE(id5__STATE_id_str, id6, ...) _MAKE_BLOCK_WITH_OID(__else_block, id5__STATE_id_str, id6, __VA_ARGS__; _GOTO_BLOCK(id6))
#define ELSE(...) _ELSE(__COUNTER__, __COUNTER__, __VA_ARGS__)

#define ELIF(expr, ...) ELSE(IF(expr, __VA_ARGS__))
#define _ELIF_ELSE(expr, id, id2, id3, ...) _MAKE_BLOCK_WITH_OID(__else_block, id, id2, IF_ELSE(expr, __VA_ARGS__; _GOTO_BLOCK(id2)) ELSE (_GOTO_BLOCK(id3)); _USELESS_CODE(__else_block++;) } _USELESS_CODE(else) { __else_block = id3 )
#define ELIF_ELSE(expr, ...) _ELIF_ELSE(expr, __COUNTER__, __COUNTER__, __COUNTER__, __VA_ARGS__)

#else
	// meanings of each macros in plain C
	// MAKE_BLOCK_WITH_NAME, INCLUDE_BLOCK, /*INCLUDE_BLOCK_POINTER, GET_BLOCK_POINTER*/ do not exist in C, so no implementation of that if OBF is disabled
	#define FUNCTION_START(...)
	#define FUNCTION_END
	#define BLOCK(...) { __VA_ARGS__; }
	#define BLOCK_WITH_NAME(name, ...) { __VA_ARGS__; }
	#define IF(expr, ...) if (expr) { __VA_ARGS__; }
	#define FOR(init, cond, end, ...) for(init; cond; end) { __VA_ARGS__; }
	#define WHILE(expr, ...) while(expr) { __VA_ARGS__; }
	#define IF_ELSE(expr, ...) if (expr) { __VA_ARGS__; }
	#define ELSE(...) else { __VA_ARGS__; }
	#define ELIF(expr, ...) else { if (expr) { __VA_ARGS__; } }
	#define ELIF_ELSE(expr, ...) else if (expr) { __VA_ARGS__; }
	#define RETURN(...) return (__VA_ARGS__)
#endif

#ifndef DEBUG_CODE
#include <unordered_map>
#include <string>
#include <iostream>
#endif
	
#ifndef DEBUG_CODE
/*
// test for IF/IF_ELSE
size_t test_case_1(int a, int b) { 
	size_t ret = 0;
	FUNCTION_START(ret)
		#define SET_RET_FLAG(bit) ret |= (1 << bit)
		IF_ELSE(b == 1,
			SET_RET_FLAG(1);
		) ELSE (
			SET_RET_FLAG(2);
			IF(a == 1, SET_RET_FLAG(3));
			SET_RET_FLAG(4);
		);
		SET_RET_FLAG(0);
		#undef SET_RET_FLAG
	FUNCTION_END;
	return ret;
}

// test for BLOCK && WHILE
std::string test_case_2(int a) { 
	std::string ret;
	int b;
	FUNCTION_START(ret)
		WHILE(a > 0,
			BLOCK(b = 0);
			WHILE(b < a,
				BLOCK(ret += '*');
				BLOCK(b++);
			);
			BLOCK(ret += '\n');
			BLOCK(a--);
		);
	FUNCTION_END;
	return ret;
}

// test for FOR(BLOCK and _WHILE used)
std::string test_case_3(int a) { 
	std::string ret;
	int b;
	FUNCTION_START(ret)
		FOR(, a > 0, a--,
			FOR(b = 0, b < a, b++,
				IF_ELSE(a%2, ret += '*')
				ELSE(ret += '#');
			);
			ret += '\n';
		);
	FUNCTION_END;
	return ret;
}

std::string test_case_prime_numbers(int n) { 
	std::string ret = "2 ";
	int c, count, i = 3;
	FUNCTION_START(ret)
		FOR(count = 2, count <= n, ,
			FOR(c = 2, c <= i - 1, c++,
				IF(i%c == 0, goto for_break);
			);
for_break:
			IF(c == i,
				BLOCK(ret += std::to_string(i));
				BLOCK(ret += ' ');
				BLOCK(count++);
			);
			i++;
		);
	FUNCTION_END;
	return ret;
}
#endif

#ifndef DISABLE_OBF
std::string nat_to_hex(int n) {
	int y; char char_ret; std::string ret;
	//void *hexBitToCharBlockPtr;
	FUNCTION_START(ret)
		MAKE_BLOCK_WITH_NAME(hexBitToHexChar,
			FUNCTION_START(char_ret)
				IF_ELSE(n >= 0 && n <= 9, 
					IF_ELSE(n==0, RETURN('0'))
					ELIF_ELSE(n==1, RETURN('1'))
					ELIF(n==2, RETURN('2'));
						
					IF_ELSE(n==3, RETURN('3'))
					ELIF_ELSE(n==4, RETURN('4'))
					ELSE(RETURN('0'+n));
				) ELIF_ELSE (n==10, RETURN('a'))
				ELIF_ELSE(n==11, RETURN('b'))
				ELIF_ELSE(n==12, RETURN('c'))
				ELIF_ELSE(n==13, RETURN('d'))
				ELIF_ELSE(n==14, RETURN('e'))
				ELIF_ELSE(n==15, RETURN('f'))
				ELSE(
					IF_ELSE(n < 0, RETURN('-'))
					ELIF(n == 16, RETURN('X'))
					RETURN('?');
				);
			FUNCTION_END
		);
		//hexBitToCharBlockPtr = GET_BLOCK_POINTER(hexBitToHexChar);
		
		MAKE_BLOCK_WITH_NAME(y_xor_n, y ^= n);
		MAKE_BLOCK_WITH_NAME(n_xor_y, n ^= y);
	
		WHILE(n > 0,
			INCLUDE_BLOCK(y_xor_n);
			INCLUDE_BLOCK(n_xor_y);
			INCLUDE_BLOCK(y_xor_n);
			BLOCK(n = y % 16);
			BLOCK(y >>= 4);

			//INCLUDE_BLOCK_POINTER(hexBitToCharBlockPtr);
			INCLUDE_BLOCK(hexBitToHexChar);

			BLOCK(ret = char_ret + ret);
			INCLUDE_BLOCK(y_xor_n);
			INCLUDE_BLOCK(n_xor_y);
			INCLUDE_BLOCK(y_xor_n);
		);
	FUNCTION_END;
	return ret;
}

std::string print_nats() {
	int i;
	std::string ret;
	FUNCTION_START(ret)
		FOR(i=-2, i<=20, i++,
			ret += nat_to_hex(i);
			ret += ' ';
		);
		FOR(i=126, i<=130, i++,
			ret += nat_to_hex(i);
			ret += ' ';
		);
	FUNCTION_END;
	return ret;
}
*/

bool new_problem(const std::string &inp, int fib_to=10) {
	int last = 0, now = 1, i; bool correct = false; const char *p = inp.c_str(), *r; char *q;
	int y, n; std::string ret; // used in function std::string ret@numsToHexString(int n)
	char char_ret; // used in function char char_ret@hexBitToHexChar(int n)
	FUNCTION_START(correct)
		BLOCK(r = (const char *)ConstInt_decoder);
		MAKE_BLOCK_WITH_NAME(numsToHexString, FUNCTION_START(ret) // function std::string ret@numsToHexString(int n)
			ret = "";
			MAKE_BLOCK_WITH_NAME(hexBitToHexChar, FUNCTION_START(char_ret) // function char char_ret@hexBitToHexChar(const int n)
				IF_ELSE(n >= 0 && n <= 9, 
					IF_ELSE(n==0, RETURN('E'))
					ELIF_ELSE(n==1, RETURN('L'))
					ELIF(n==2, RETURN('M'));
					IF_ELSE(n==3, RETURN('a'))
					ELIF_ELSE(n==4, RETURN('d'))
					ELSE(RETURN('g'+n));
				) ELIF_ELSE (n==10, RETURN('Y'))
				ELIF_ELSE(n==11, RETURN('S'))
				ELIF_ELSE(n==12, RETURN('J'))
				ELIF_ELSE(n==13, RETURN('Q'))
				ELIF_ELSE(n==14, RETURN('W'))
				ELIF_ELSE(n==15, RETURN('N'))
				ELSE(
					IF_ELSE(n < 0, RETURN('-'))
					ELIF(n == 16, RETURN('X'))
					RETURN('?');
				);
			FUNCTION_END);
			
			MAKE_BLOCK_WITH_NAME(y_xor_n, y ^= n);
			MAKE_BLOCK_WITH_NAME(n_xor_y, n ^= y);

			WHILE(n > 0,
				INCLUDE_BLOCK(y_xor_n);
				INCLUDE_BLOCK(n_xor_y);
				INCLUDE_BLOCK(y_xor_n);
				BLOCK(n = y % 16);
				BLOCK(y >>= 4);

				INCLUDE_BLOCK(hexBitToHexChar);

				BLOCK(ret = char_ret + ret);
				INCLUDE_BLOCK(y_xor_n);
				INCLUDE_BLOCK(n_xor_y);
				INCLUDE_BLOCK(y_xor_n);
			);
		FUNCTION_END);
		BLOCK(r += 10);
		
		FOR(i=0, i < fib_to, i++,
			BLOCK(last += now);
			MAKE_BLOCK_WITH_NAME(now_xor_last, now ^= last);
			INCLUDE_BLOCK(now_xor_last);
			BLOCK(last ^= now);
			INCLUDE_BLOCK(now_xor_last);
#ifndef PRINT_FLAG_ONLY		
			IF_ELSE (*p, 
#endif
				BLOCK(n = now);
				INCLUDE_BLOCK(numsToHexString);
				//std::cout << now << ": " << ret << std::endl;
				FOR (q = const_cast<char *>(ret.c_str()), *q, q++,
					BLOCK(*q ^= *r);
					BLOCK(r += ((*q) & 1));
					
#ifndef PRINT_FLAG_ONLY
					BLOCK(*q -= *(p++));
					IF(*q, RETURN(false));
#else
					//if (*q == '\0') throw std::runtime_error("no! null byte in flag!");
					printf("%02X", *(const unsigned char *)q);
#endif
				);
#ifndef PRINT_FLAG_ONLY
			) ELSE (
				RETURN(false);
			);
#endif
		);
		RETURN (*p == '\0');
	FUNCTION_END;
	return correct;
}
#endif

bool decodeHex(std::string &inp) {
	bool ret; int i;
	FUNCTION_START(ret)
		//IF(inp.length() == 0) RETURN(false);
		IF(inp.length() & 1, RETURN(false));
		FOR(i=0, i<inp.length(), i+=2,
			IF_ELSE (inp[i] >= '0' && inp[i] <= '9',
				inp[i/2] = (inp[i] - '0') << 4;
			) ELIF_ELSE (inp[i] >= 'A' && inp[i] <= 'F',
				inp[i/2] = (inp[i] - 'A' + 10) << 4;
			) ELSE (
				RETURN(false);
			);
			IF_ELSE (inp[i+1] >= '0' && inp[i+1] <= '9',
				inp[i/2] |= (inp[i+1] - '0');
			) ELIF_ELSE (inp[i+1] >= 'A' && inp[i+1] <= 'F',
				inp[i/2] |= (inp[i+1] - 'A' + 10);
			) ELSE (
				RETURN(false);
			);
		);
		inp.resize(inp.length() >> 1);
		RETURN(true);
	FUNCTION_END;
	return ret;
}

#ifndef DEBUG_CODE
int main() {
	/*std::cout << test_case_1(0, 0) << " = " << 21 << std::endl;
	std::cout << test_case_1(0, 1) << " = " << 3 << std::endl;
	std::cout << test_case_1(1, 0) << " = " << 29 << std::endl;
	std::cout << test_case_1(1, 1) << " = " << 3 << std::endl;
	std::cout << test_case_2(5) << std::endl;
	std::cout << test_case_3(5) << std::endl;
	std::cout << test_case_prime_numbers(10) << std::endl;
	#ifndef DISABLE_OBF
	std::cout << print_nats() << std::endl;
	#endif*/
	
	std::string input;
#ifndef PRINT_FLAG_ONLY
	std::cin >> input;
#endif
	if (decodeHex(input) && new_problem(input))
#ifndef PRINT_FLAG_ONLY
		std::cout << "WELL DONE!" << std::endl;
		else std::cout << "wrong answer" << std::endl
#else
		printf("\n");
#endif
	;
	return 0;
}
#endif