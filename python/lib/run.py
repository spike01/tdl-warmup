import logging
import sys

from tdl.client import Client
from tdl.processing_rules import ProcessingRules

from app import App


def configure_logging():
    ch = logging.StreamHandler(sys.stdout)
    ch.setLevel(logging.INFO)
    formatter = logging.Formatter(
            '%(asctime)s - %(name)s - %(levelname)s - %(message)s'
    )
    ch.setFormatter(formatter)
    logger = logging.getLogger('tdl.client')
    logger.setLevel(logging.INFO)
    logger.addHandler(ch)


# STEP 1. Start the "sum_numbers" challenge from the remote web interface

# ~~~~~~~~~ Setup ~~~~~~~~~

# STEP 2. Set the hostname and username
HOSTNAME = 'server_hostname'
USERNAME = 'your_username'

# STEP 3. Run the client in trial mode and read the instructions
I_AM_READY = False
"""
  ~~~  How to run ~~~

  From command line:
     If you want to trial run:     PYTHONPATH=lib python lib/run.py

  From IDE:
     Run this class from IDE.
"""

def main(args):
    value_from_commandline = len(args) > 0 and args[0] == "ready"
    ready = True if value_from_commandline else I_AM_READY
    print("Ready ? = {}".format(ready))

    start_client(ready)


def start_client(ready):
    client = Client(hostname=HOSTNAME, username=USERNAME)

    rules = ProcessingRules()
    rules.on("display_description").call(display_and_save_description).then("publish")
    # STEP 4. Uncomment the following line to register the sum method and run again
    # rules.on("sum").call(App.sum).then(publish_if(ready))

    # STEP 5. Run the test (test/test_app.py) and see it fail
    # STEP 6. Fix the sum method implementation in lib/app.py

    client.go_live_with(rules)


def publish_if(ready):
    return "publish" if ready else "stop"

# STEP 7. If your are satisfied with the implementation, run the client in live mode !
"""
  ~~~  How to run ~~~

  From command line:
     If you are ready to go live:  PYTHONPATH=lib python lib/run.py ready

  From IDE:
     Set the I_AM_READY variable to "true" and run this file
"""

# STEP 8. Go to the web interface and mark the challenge as done


# ~~~~~~~~~ Provided implementations ~~~~~~~~~

def display_and_save_description(label, description):
    print('Starting round: '.format(label))
    print(description)

    output = open("challenges/{}.txt".format(label), "w")
    output.write(description)
    output.close()
    print "Challenge description saved to file: {}.".format(output.name)

    return 'OK'


# ~~~~~~~~~ Run ~~~~~~~~~

configure_logging()
main(sys.argv[1:])
