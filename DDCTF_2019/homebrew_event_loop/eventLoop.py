# -*- encoding: utf-8 -*-
# written in python 2.7
__author__ = 'garzon'

from flask import Flask, session, request, Response
import urllib

app = Flask(__name__)
#<hidden>
import uuid
# this part is hidden from the contestants of the challenge for reducing unnecessary complexity
app.secret_key = 'theDthN4y56S7u563jhjh56iRr785j5rHhj5hj5H4hjH53hbty857omnEi6H7vcv24rfcvr'
url_prefix = '/<string:prefix>'

valid_url_prefixs = {
	'd5afe1f66747e857': '3v41_3v3nt_100p_aNd_fLASK_cOOk1e',
	'd5af31f99147e857': '3v41_3v3nt_1OOp_aNd_fLASK_cOOk1e',
	'd5af31f66147e657': '3v41_3v3nt_1O0p_aNd_fLASK_cOOk1e',
	'd5af31f86147e857': '3v41_3v3nt_10Op_aNd_fLASK_cOOk1e',
	'd5afe1f66147e857': '3v41_3v3nt_100p_aNd_fLASK_c0Ok1e',
	'd5af31f96147e657': '3v41_3v3nt_100p_aNd_fLASK_cO0k1e',
	'd5af31f66147e857': '3v41_3v3nt_100p_aNd_fLASK_c00k1e',
	'd5af31f66741e857': '3v4l_3v3nt_100p_aNd_fLASK_cOOk1e',
	'd5af33f66147e857': '3v41_3v3nt_100p_aNd_fLASK_cOOkle',
	'd5af31f88147e857': '3v41_3v3nt_l00p_aNd_fLASK_cOOkle',
	'd5af31f66177e857': '3v4l_3v3nt_100p_aNd_fLASK_cOOkle', }

def FLAG():
	flag = valid_url_prefixs[request.user_prefix]
	try:
		with open('flag.log', 'ab') as f:
			f.write(str((request.remote_addr, flag, session['log'])) + '\n')
	except:
		return 'Something went wrong, please contact admin of DDCTF to get your flag.'
	return flag
	
original_app_route = app.route
def new_app_route(url_pattern, **kwargs):
	def __dummy(f):
		def _(*args, **kwargs):
			if kwargs['prefix'] not in valid_url_prefixs: return '404 NOT FOUND', 404
			request.user_prefix = kwargs['prefix']
			del kwargs['prefix']
			if len(args) == 0 and len(kwargs) == 0: return f()
			if len(kwargs) == 0: return f(*args)
			if len(args) == 0: return f(**kwargs)
			return f(*args, **kwargs)
		_.__name__ = str(uuid.uuid4())
		return original_app_route(url_pattern, **kwargs)(_)
	return __dummy
app.route = new_app_route
	
'''
#</hidden>
app.secret_key = '*********************' # censored
url_prefix = '{{URL_PREFIX}}'

def FLAG():
	return 'FLAG_is_here_but_i_wont_show_you'  # censored
#<hidden>
'''
#</hidden>
	
def trigger_event(event):
	session['log'].append(event)
	if len(session['log']) > 5: session['log'] = session['log'][-5:]
	if type(event) == type([]):
		request.event_queue += event
	else:
		request.event_queue.append(event)

def get_mid_str(haystack, prefix, postfix=None):
	haystack = haystack[haystack.find(prefix)+len(prefix):]
	if postfix is not None:
		haystack = haystack[:haystack.find(postfix)]
	return haystack
	
class RollBackException: pass

#<hidden>
# final payload: /?action:trigger_event%23;action:buy;5%23action:get_flag;
#</hidden>
def execute_event_loop():
	valid_event_chars = set('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_0123456789:;#')
	resp = None
	while len(request.event_queue) > 0:
		event = request.event_queue[0] # `event` is something like "action:ACTION;ARGS0#ARGS1#ARGS2......"
		request.event_queue = request.event_queue[1:]
		if not event.startswith(('action:', 'func:')): continue
		for c in event:
			if c not in valid_event_chars: break
		else:
			is_action = event[0] == 'a'
			action = get_mid_str(event, ':', ';')
			args = get_mid_str(event, action+';').split('#')
			try:
				event_handler = eval(action + ('_handler' if is_action else '_function'))
				ret_val = event_handler(args)
			except RollBackException:
				if resp is None: resp = ''
				resp += 'ERROR! All transactions have been cancelled. <br />'
				resp += '<a href="./?action:view;index">Go back to index.html</a><br />'
				session['num_items'] = request.prev_session['num_items']
				session['points'] = request.prev_session['points']
				break
			except Exception, e:
				if resp is None: resp = ''
				#resp += str(e) # only for debugging
				continue
			if ret_val is not None:
				if resp is None: resp = ret_val
				else: resp += ret_val
	if resp is None or resp == '': resp = ('404 NOT FOUND', 404)
	session.modified = True
	return resp
	
@app.route(url_prefix+'/')
def entry_point():
	querystring = urllib.unquote(request.query_string)
	request.event_queue = []
	if querystring == '' or (not querystring.startswith('action:')) or len(querystring) > 100:
		querystring = 'action:index;False#False'
	if 'num_items' not in session:
		session['num_items'] = 0
		session['points'] = 3
		session['log'] = []
	request.prev_session = dict(session)
	trigger_event(querystring)
	return execute_event_loop()

# handlers/functions below --------------------------------------

def view_handler(args):
	page = args[0]
	html = ''
	html += '[INFO] you have {} diamonds, {} points now.<br />'.format(session['num_items'], session['points'])
	if page == 'index':
		html += '<a href="./?action:index;True%23False">View source code</a><br />'
		html += '<a href="./?action:view;shop">Go to e-shop</a><br />'
		html += '<a href="./?action:view;reset">Reset</a><br />'
	elif page == 'shop':
		html += '<a href="./?action:buy;1">Buy a diamond (1 point)</a><br />'
	elif page == 'reset':
		del session['num_items']
		html += 'Session reset.<br />'
	html += '<a href="./?action:view;index">Go back to index.html</a><br />'
	return html

def index_handler(args):
	bool_show_source = args[0]
	bool_download_source = args[1]
	if bool_show_source == 'True':
	
		source = open('eventLoop.py', 'r')
		html = ''
		if bool_download_source != 'True':
			html += '<a href="./?action:index;True%23True">Download this .py file</a><br />'
			html += '<a href="./?action:view;index">Go back to index.html</a><br />'
			
		#<hidden>
		is_hidden = False
		#</hidden>
		for line in source:
			#<hidden>
			if line.strip() == '#</hidden>':
				is_hidden = False
				continue
			if line.strip() == '#<hidden>':
				is_hidden = True
			if is_hidden: continue
			line = line.replace('{{URL_PREFIX}}', '/'+request.user_prefix)
			#</hidden>
			if bool_download_source != 'True':
				html += line.replace('&','&amp;').replace('\t', '&nbsp;'*4).replace(' ','&nbsp;').replace('<', '&lt;').replace('>','&gt;').replace('\n', '<br />')
			else:
				html += line
		source.close()
		
		if bool_download_source == 'True':
			headers = {}
			headers['Content-Type'] = 'text/plain'
			headers['Content-Disposition'] = 'attachment; filename=serve.py'
			return Response(html, headers=headers)
		else:
			return html
	else:
		trigger_event('action:view;index')
		
def buy_handler(args):
	num_items = int(args[0])
	if num_items <= 0: return 'invalid number({}) of diamonds to buy<br />'.format(args[0])
	session['num_items'] += num_items 
	trigger_event(['func:consume_point;{}'.format(num_items), 'action:view;index'])
	
def consume_point_function(args):
	point_to_consume = int(args[0])
	if session['points'] < point_to_consume: raise RollBackException()
	session['points'] -= point_to_consume
	
def show_flag_function(args):
	flag = args[0]
	#return flag # GOTCHA! We noticed that here is a backdoor planted by a hacker which will print the flag, so we disabled it.
	return 'You naughty boy! ;) <br />'
	
def get_flag_handler(args):
	if session['num_items'] >= 5:
		trigger_event('func:show_flag;' + FLAG()) # show_flag_function has been disabled, no worries
	trigger_event('action:view;index')
	
if __name__ == '__main__':
	app.run(debug=False, host='0.0.0.0')
