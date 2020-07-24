from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import argparse
import atexit
import logging
import multiprocessing
import sys
import time
# import the generated classes
import adsrank_pb2
import adsrank_pb2_grpc
import grpc

PROCESS_COUNT = 8
MAXIMUM_RUNS = 10000

Channel = None
Stub = None
# LOGGER = logging.getLogger(__name__)

def shutdown_worker():
    # LOGGER.info('Shutting worker process down.')
    if Channel is not None:
        Channel.stop()

def initialize_worker(server_address):
    global Channel
    global Stub
    #LOGGER.info('Initializing worker process.')
    Channel = grpc.insecure_channel(server_address)
    Stub = adsrank_pb2_grpc.AdsrankStub(Channel)
    atexit.register(shutdown_worker)

def run_worker_query(x):
    user_details = adsrank_pb2.UserDetails(vector = "vector",is_logged_in = True)
    device_state = adsrank_pb2.DeviceState(connection_type = "home",carrier = "line",model = "VGG",latitude = 5,longitude = 6)
    request = adsrank_pb2.AdScoresRequest(city = "bbsr",state = "odisha", object_ids = ["rt","yt"], user_details = user_details)
    metadata = (('x-mynt-ctx', '1234'),('random','random value'))
    return Stub.ScoreAdsUsingVector(request = request, metadata = metadata)

def start_servers(server_address):
    worker_pool = multiprocessing.Pool(processes=PROCESS_COUNT,initializer=initialize_worker,initargs=(server_address,))
    runs = range(2, MAXIMUM_RUNS)
    primality = worker_pool.map(run_worker_query, runs)
    return primality

def main():
    msg = ''
    parser = argparse.ArgumentParser(description=msg)
    parser.add_argument('server_address')
    args = parser.parse_args()
    response_list = start_servers(args.server_address)
    print(response_list)

if __name__ == '__main__':
    start = time.time()
    # handler = logging.StreamHandler(sys.stdout)
    # formatter = logging.Formatter('[PID %(process)d] %(message)s')
    # handler.setFormatter(formatter)
    # LOGGER.addHandler(handler)
    # LOGGER.setLevel(logging.INFO)
    main()
    print(time.time() - start)
