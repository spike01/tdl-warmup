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


def main(args):
    """
       To run without publishing:                  PYTHONPATH=lib python lib/run.py
       To go live, run and publish all responses:  PYTHONPATH=lib python lib/run.py ready
    """
    ready = True if (len(args) > 0 and args[0] == "ready") else False
    print("Ready ? = {}".format(ready))

    start_client(ready)


def start_client(ready):
    client = Client(hostname='localhost', username='julian')

    rules = ProcessingRules()
    rules.on("display_description").call(display_description).then("publish")
    rules.on("sum").call(App.sum).then(publish_if(ready))

    client.go_live_with(rules)


def publish_if(ready):
    return "publish" if ready else "stop"


# ~~~~~~~~~ Provided implementations ~~~~~~~~~

def display_description(label, description):
    print('Starting round: '.format(label))
    print(description)
    return 'OK'


# ~~~~~~~~~ Run ~~~~~~~~~

configure_logging()
main(sys.argv[1:])
