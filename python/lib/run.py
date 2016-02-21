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


# ~~~~~~~~~ Setup ~~~~~~~~~

I_AM_READY = False


def main(args):
    """
      ~~~  How to run ~~~

      From command line:
         If you want to trial run:     PYTHONPATH=lib python lib/run.py
         If you are ready to go live:  PYTHONPATH=lib python lib/run.py ready

      From IDE:
         Run this class from IDE.
         Set the I_AM_READY variable to "true" if ready to go live
    """
    value_from_commandline = len(args) > 0 and args[0] == "ready"
    ready = True if value_from_commandline else I_AM_READY
    print("Ready ? = {}".format(ready))

    start_client(ready)


def start_client(ready):
    client = Client(hostname='localhost', username='julian')

    rules = ProcessingRules()
    rules.on("display_description").call(display_and_save_description).then("publish")
    rules.on("sum").call(App.sum).then(publish_if(ready))

    client.go_live_with(rules)


def publish_if(ready):
    return "publish" if ready else "stop"


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
