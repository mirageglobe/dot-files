
# usage
# python3 <file>

# === main

class ClassName:

    kind = 'generalstat'            # class variable shared by all instances

    def __init__(self, name):
        self.name = name            # instance variable unique to each instance

    def f(self):
        return 'hello world'

fido = ClassName('Fido')
fido.kind
fido.name