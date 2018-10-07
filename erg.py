import os
import subprocess
import pickle
from itertools import islice
from multiprocessing import Pool, Value

import delphin
from delphin.interfaces import ace


i = Value('i', 0)
subprocess.call('mkdir data/cache -p', shell=True)


# parse data here
def one_response(inp, timeout=60):
    inp = inp.strip()
    response = ace.parse('ace/erg-1214-x86-64-0.9.28.dat', inp, 
            executable='ace/ace-0.9.28/ace',
            cmdargs=['--timeout', str(timeout)])

    with i.get_lock():
        i.value += 1
        print('Parsed %d sentence: %s' % (i.value, inp))

    return response.result(0)

def ace_responses(it, workers=24):
    p = Pool(workers)
    return p.map(one_response, it)

responses_path = 'data/cache/reference.pkl'
data_path = 'data/trg-en/reference'
if not os.path.exists(responses_path):
    print('No cache. Generating ERG parses with ACE for %s...' % data_path)
    responses = ace_responses(open(data_path, 'rt'))
    pickle.dump(responses, open(responses_path, 'wb'))


# process data here
for response in responses:
    pass
