# UT Austin ML, Fall 2020

May be useful:
https://github.com/lambdalisue/jupyter-vim-binding vim_binding

```zsh
virtualenv ml_env
source ml_env/bin/activate
pip install numpy pandas seaborn matplotlib sklearn
pip install jupyterlab
pip install jupyter-kite

jupyter labextension install "@kiteco/jupyterlab-kite"
jupyter labextension install @axlair/jupyterlab_vim

pip freeze > requirements.txt
pip install -r requirements.txt
```
