/*
 * YARA rules for Magus source-level mports checks.
 *
 * These rules intentionally warn instead of failing a scan. They look for
 * shell patterns in port metadata, package scripts/messages, templates, and
 * patch files that deserve maintainer review.
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
