from tdl.client import Client


class App:
    def main(self):
        implementation_map = {
            'sum': lambda params: self.sum(*params)
        }
        client = Client('localhost', 21613, 'tpreece')
        client.trial_run_with(implementation_map)

    @staticmethod
    def sum(x, y):
        return x + y
