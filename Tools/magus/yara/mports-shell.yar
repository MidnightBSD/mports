/*
 * YARA rules for Magus source-level mports checks.
 *
 * These rules intentionally warn instead of failing a scan. They look for
 * suspicious shell and scripting-language patterns in port metadata, package
 * scripts/messages, templates, helper programs, and patch files that deserve
 * maintainer review.
 */

rule Mports_Fetch_Piped_To_Shell
{
  meta:
    description = "Network fetch command piped directly to a shell"
  strings:
    $pipe = /(fetch|curl|wget|ftp)[^\r\n|;]{0,512}\|[ \t]*(\/usr\/bin\/env[ \t]+)?(\/bin\/)?(sh|csh|ksh|bash|zsh)([ \t\r\n;]|$)/ nocase
  condition:
    $pipe
}

rule Mports_Eval_Network_Fetch
{
  meta:
    description = "eval executing output from a network fetch command"
  strings:
    $cmdsub = /eval[ \t]+[`$][(]?[^\r\n]{0,256}(fetch|curl|wget|ftp)/ nocase
    $fetch_eval = /(fetch|curl|wget|ftp)[^\r\n]{0,256}\|[ \t]*(\/bin\/)?(sh|csh|ksh|bash|zsh)[ \t]+-c[ \t]+/ nocase
  condition:
    any of them
}

rule Mports_Reverse_Shell_Command
{
  meta:
    description = "Common reverse-shell style command"
  strings:
    $nc_exec = /\b(nc|netcat|ncat)[ \t]+[^\r\n]{0,256}[ \t]+-e[ \t]+(\/bin\/)?(sh|csh|ksh|bash|zsh)\b/ nocase
    $socat_exec = /\bsocat[ \t]+[^\r\n]{0,256}EXEC:(\/bin\/)?(sh|csh|ksh|bash|zsh)\b/ nocase
    $mkfifo_shell = /\bmkfifo[ \t]+[^\r\n;]+;[^\r\n]{0,512}(\/bin\/)?(sh|csh|ksh|bash|zsh)[^\r\n]{0,512}\|[^\r\n]{0,512}\b(nc|netcat|ncat)\b/ nocase
  condition:
    any of them
}

rule Mports_Destructive_Root_Remove
{
  meta:
    description = "Destructive recursive remove targeting filesystem root"
  strings:
    $rm_root = /\brm[ \t]+-[A-Za-z]*r[A-Za-z]*f[A-Za-z]*[ \t]+(\/|\/\*)[ \t\r\n;#]/ nocase
  condition:
    $rm_root
}

rule Mports_Perl_Suspicious_Command_Execution
{
  meta:
    description = "Perl command execution using network fetches or shell pipes"
  strings:
    $system_fetch = /\bsystem[ \t]*\([^\r\n]{0,512}\b(curl|wget|fetch|ftp)\b/ nocase
    $qx_fetch = /\bqx[ \t]*[\(\{\[\/!"'#|]?[^\r\n]{0,512}\b(curl|wget|fetch|ftp)\b/ nocase
    $backtick_fetch = /`[^\r\n`]{0,512}\b(curl|wget|fetch|ftp)\b[^\r\n`]*`/ nocase
    $open_pipe_shell = /\bopen[ \t]*\([^\r\n]{0,512}\|[ \t]*(\/bin\/)?(sh|csh|ksh|bash|zsh)\b/ nocase
  condition:
    any of them
}

rule Mports_Python_Suspicious_Command_Execution
{
  meta:
    description = "Python shell execution, remote retrieval, or base64 decoded exec"
  strings:
    $subprocess_shell = /\bsubprocess\.(run|call|Popen|check_call|check_output)[ \t]*\([^\r\n]{0,512}\bshell[ \t]*=[ \t]*True\b/ nocase
    $urlretrieve = /\burllib\.request\.urlretrieve[ \t]*\(/ nocase
    $b64_then_exec = /\bbase64\.b64decode[ \t]*\([^\r\n]{0,512}\)[^\r\n]{0,256}\bexec[ \t]*\(/ nocase
    $exec_b64 = /\bexec[ \t]*\([^\r\n]{0,512}\bbase64\.b64decode[ \t]*\(/ nocase
  condition:
    any of them
}

rule Mports_JavaScript_Suspicious_Command_Execution
{
  meta:
    description = "JavaScript process execution, eval, or base64 decoding"
  strings:
    $child_process_exec = /\bchild_process\.exec(File)?[ \t]*\([^\r\n]{0,512}\b(curl|wget|fetch|ftp|sh|bash|zsh|ksh|csh)\b/ nocase
    $require_exec = /\brequire[ \t]*\([ \t]*['"]child_process['"][ \t]*\)[ \t]*\.[ \t]*exec(File)?[ \t]*\(/ nocase
    $eval_call = /\beval[ \t]*\([^\r\n]{1,512}\)/ nocase
    $buffer_base64 = /\bBuffer\.from[ \t]*\([^\r\n]{0,512},[ \t]*['"]base64['"][ \t]*\)/ nocase
  condition:
    any of them
}
