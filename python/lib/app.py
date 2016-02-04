from tdl.client import Client


def display_description(params):
    return display_round_id_and_info(params[0], params[1])


def display_round_id_and_info(round_id, info):
    print('Starting round: '.format(round_id))
    print(info)
    return 'OK'

def to_uppercase(params):
    astring = params[0]
    return astring.upper()


def count_lines(params):
    lines_str = params[0]
    return len(lines_str.split('\n')) if lines_str else 0

def fizz_buzz(params):
    number = params[0]
    if (number % 3 == 0 or '3' in str(number)) and (number % 5 == 0 or '5' in str(number)):
        return "fizz buzz"
    elif number % 3 == 0 or '3' in str(number):
        return "fizz"
    elif number % 5 == 0 or '5' in str(number):
        return "buzz"
    else:
        return number



class App:
    def main(self):
        implementation_map = {
            'display_description': {
                'test_implementation': display_description,
                'action': 'publish'
            },
            'increment': {
                'test_implementation': lambda x: x[0] + 1,
                'action': 'publish'

            },
            'to_uppercase': {
                'test_implementation': to_uppercase,
                'action': 'publish'

            },
            'sum': {
                'test_implementation': sum,
                'action': 'publish'

            },
            'count_lines': {
                'test_implementation': count_lines,
                'action': 'publish'

            },
            'fizz_buzz': {
                'test_implementation': fizz_buzz,
                'action': 'publish'
            }
 
        }
        client = Client('172.20.10.2', 61613, 'tpreece')
        client.go_live_with(implementation_map)

    @staticmethod
    def sum(x, y):
        return x + y
