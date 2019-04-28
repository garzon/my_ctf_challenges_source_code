import sys, os

for addr in ['15U7TCV1gvpN4fQBMb5hD8mT3JqxjTaiTh',
	'1EDjt68Zfbxacg9m5Q4295xmtyihJNqpAr',
	'1EaPk4jQBt7yWEyG6hRaFcnZwHga9tgp3J',
	'173P8sXU3umqVjtCNEEeYRXXrpNsUDqVAZ',
	'1A2W1eCrVww2P25YngwCAKm19kUvK8yXT8',
	'1AR8JZLrXCnV1M1Pm7ZsHmaKdqviF1Jrbk',
	'1CdGynJjQRmN6bxs4xMtsxjjb3i9q59ahQ',
	'15VT2bqjm4tJViwphpmQwZVGFcn5jMefFK',
	'166VBSnZkxzZKWBfEQ2EaU5u1ZSNA7XFFe',
	'1DTj262z6UzhhwLFzL3C5fpTEMVQFPJ6iV']:
	addr = addr.strip()
	os.system('python replace_addr.py '+addr)