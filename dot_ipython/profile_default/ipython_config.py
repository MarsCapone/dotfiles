## lines to run at ipython startup
c.InteractiveShellApp.exec_lines = [
    "import os, sys",
    "from pathlib import Path",
    "from datetime import datetime, timedelta, date",
    "from enum import Enum",
]

## log level
c.Application.log_level = "ERROR"

## don't display the banner
c.TerminalIPythonApp.display_banner = False

## don't confirm exit
c.TerminalInteractiveShell.confirm_exit = False

## use vi bindings
c.TerminalInteractiveShell.editing_mode = "vi"

### Jupyter Notebook Configuration
c.NotebookApp.open_browser = False
c.NotebookApp.autoreload = True

### Custom Prompt

from IPython.terminal.prompts import Prompts, Token
from pathlib import Path
import os
import sys

class CustomPrompt(Prompts):
    def out_prompt_tokens(self):
        # no output token
        return []

    @staticmethod
    def _get_pyenv_version():
        version = os.environ.get("PYENV_VERSION")
        version = sys.version_info
        if version:
            return f"{version.major}.{version.minor} "
        return ""

    def vi_mode(self):
        mode = super().vi_mode().strip("[]")
        if not mode:
            return ""
        mapping = {"i": "INSERT", "n": "NORMAL", "v": "VISUAL", "r": "REPLACE"}
        return mapping[mode[0]]


    def in_prompt_tokens(self, cli=None):
        return [
            #(Token.Comment, f"~/{Path().absolute().relative_to(Path.home())}"),
            #(Token, "\n"),
            (Token.Text, self.vi_mode().lower()[0]),
            (Token, " " if self.vi_mode() else ""),
            (Token.Prompt, self._get_pyenv_version()),
            (
                Token.Prompt if self.shell.last_execution_succeeded else Token.Generic.Error,
                "❯ "
            ),
        ]

    def continuation_prompt_tokens(self, width=None):
        return [(Token.Text, "... " if self.vi_mode() else ". ")]


## Class used to generate Prompt token for prompt_toolkit
#  Default: 'IPython.terminal.prompts.Prompts'
c.TerminalInteractiveShell.prompts_class = CustomPrompt
