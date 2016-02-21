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

def main():
    start_client()


def start_client():
    client = Client(hostname='localhost', username='julian')

    rules = ProcessingRules()
    rules.on("display_description").call(display_description).then("publish")
    rules.on("sum").call(App.sum).then("stop")

    client.go_live_with(rules)


# ~~~~~~~~~ Provided implementations ~~~~~~~~~

def display_description(label, description):
    print('Starting round: '.format(label))
    print(description)
    return 'OK'


# ~~~~~~~~~ Run ~~~~~~~~~

configure_logging()
main()
