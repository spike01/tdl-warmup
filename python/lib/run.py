import logging
import sys

from app import App


ch = logging.StreamHandler(sys.stdout)
ch.setLevel(logging.INFO)
formatter = logging.Formatter(
    '%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
ch.setFormatter(formatter)
logger = logging.getLogger('tdl.client')
logger.setLevel(logging.INFO)
logger.addHandler(ch)


a = App()
a.main()
