#include <rodsClient.h>


int main(int argc, char *argv[]) {
    setenv(SP_OPTION, "meta-add-reproc", 1);
    rodsEnv env;
    rErrMsg_t errmsg;
    rcComm_t *conn = NULL;

    int status = getRodsEnv(&env);
    if (status != 0) {
        fprintf(stderr, "Failed to load iRODS environment\n");
        return 1;
    }

    conn = rcConnect(env.rodsHost, env.rodsPort, env.rodsUserName,
                     env.rodsZone, NO_RECONN, &errmsg);
    if (!conn) {
        fprintf(stderr, "Failed to connect\n");
        return 1;
    }

    fprintf(stderr, "Connected to %s:%d zone %s as %s\n",
            env.rodsHost, env.rodsPort, env.rodsZone,
            env.rodsUserName);

#if IRODS_VERSION_INTEGER && IRODS_VERSION_INTEGER < (4*1000000 + 2*1000 + 8)
    init_client_api_table();
#else
    load_client_api_plugins();
#endif

    status = clientLogin(conn, "", "");
    if (status != 0) {
        fprintf(stderr, "Failed to login\n");
        return 1;
    }

    rcDisconnect(conn);

    return 0;
}
