#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <syslog.h>

int main(int argc, char *argv[])
{
    if (argc != 3)
    {
        openlog("writer", LOG_PID, LOG_USER);
        syslog(LOG_ERR, "Invalid number of arguments");
        closelog();
        return 1;
    }

    char *writefile = argv[1];
    char *writestr = argv[2];

    openlog("writer", LOG_PID, LOG_USER);

    syslog(LOG_DEBUG, "Writing %s to %s", writestr, writefile);

    FILE *fp = fopen(writefile, "w");

    if (fp == NULL)
    {
        syslog(LOG_ERR, "Failed to open file %s", writefile);
        closelog();
        return 1;
    }

    if (fprintf(fp, "%s", writestr) < 0)
    {
        syslog(LOG_ERR, "Failed to write to file %s", writefile);
        fclose(fp);
        closelog();
        return 1;
    }

    fclose(fp);
    closelog();

    return 0;
}