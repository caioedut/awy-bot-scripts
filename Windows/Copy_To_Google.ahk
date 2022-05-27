; CTRL + SHIFT + C, copy content and search on google

^+c::
{
    Send, ^c
    Sleep 100
    Run, https://www.google.com/search?q=%clipboard%
    Return
}
