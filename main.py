"""
1. Make a directory for the analysis

"""
import click
from pathlib import Path
from typing import NamedTuple
import stan

class Examples(NamedTuple):
    model11 = "examples/m11/model11.stan"

@click.command()
@click.option('--analysis-name', required=True, type=str)
@click.option('--model-path', required=True, type=str)
def main(analysis_name):

    analysis_dir = Path(analysis_name)

    if not analysis_dir.is_dir():
        analysis_dir.mkdir()

def compile_stan_model(model_path_str): 
    with open(model_path_str, 'r') as stan_model:
         model_code = stan_model.read()
    
    stan_model = stan.build(model_code)
    return stan_model

def run_stan_model(analysis_dir):
    ...
if __name__ == "__main__":
    main()
