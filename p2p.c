#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <stdint.h>
#include <strings.h>
#include <netdb.h>

#define PORT 8080
//#define ADDRESS_MASK "172.16.1.%d"
#define ADDRESS_MASK "127.0.0.%d"

#define POEM_LINE "BLABLA"
#define POEM_LINE_CLIENT 1
#define POEM_LINE_NUM 1
#define POEM_LINE_LENGHT 6

int32_t numbers[POEM_LINE_NUM];
char poem[256][POEM_LINE_NUM];
int stop = -1;

int is_poem_ready() {

    int ready = 1;

    for(int i = 0; i < POEM_LINE_NUM; i++) {

        if(numbers[i] == -1) return -1;

    }

    printf("Poem is ready!\n");

    return 1;

}

void print_poem() {

    for(int i = 0; i < POEM_LINE_NUM; i++) {

        printf(poem[i]);

    }

}

void *client(void *arg) {

    printf("Klient start\n");

    int client_socket;
    struct sockaddr_in server_address;
    int status;
    int32_t poem_line_number = -1;
    int32_t poem_line_length = POEM_LINE_LENGHT;
    char yes[256] = "yes";
    char no[256] = "no";
    int current_ip = 1;
    char ip[20];

    //Działaj dopóki nie otrzymamy całego wiersza
    while(is_poem_ready() < 0) {

        //printf("Poem not ready scanning...\n");

        client_socket = socket(AF_INET, SOCK_STREAM, 0);

        if (client_socket < 0) printf("Client ERROR opening socket\n");
        
        else {

            //printf("Client opening socket\n");
            server_address.sin_family = AF_INET;
            server_address.sin_port = htons(PORT);
            //printf("Building ip address\n");
            printf("Attempting to connect to *%d\n", current_ip);

            snprintf(ip, sizeof(ip), ADDRESS_MASK, current_ip);

            if (inet_pton(AF_INET, ip, &server_address.sin_addr) <= 0) {
                printf("ERROR bulding ip address\n");
            } else {

                //printf("Ip address ready\n");

            }

            if (connect(client_socket, (struct sockaddr *) &server_address, sizeof(server_address)) < 0) {
				
                printf("Client ERROR connecting\n");
                
			} else {

            status = read(client_socket, &poem_line_number, sizeof(int32_t));
            printf("Client got line number %d, from %s\n", poem_line_number, ip);

            printf("DEBUG poem line number %d, numbers[%d], %d\n", poem_line_number, poem_line_number - 1 ,numbers[poem_line_number - 1]);

            if (numbers[poem_line_number - 1] == poem_line_number) {

                //printf("sending no\n");
                status = write(client_socket, no, 256);
                printf("Client sent message %s\n", no);

            } else if (poem_line_number > 0 && poem_line_number - 1 < POEM_LINE_NUM) {

                //printf("sending yes");
                status = write(client_socket, yes, 256);
                printf("Client sent message %s\n", yes);
                status = read(client_socket, &poem_line_length, sizeof(int32_t));
                char poem_line[poem_line_length];
                status = read(client_socket, poem_line, poem_line_length);
                printf("%s\n", poem_line);

                numbers[poem_line_number - 1] = poem_line_number;
                *poem[poem_line_number] = poem_line;

            }

            //current_ip++;
            if (current_ip >= 254)
                current_ip = 1;

            close(client_socket);

        }

        sleep(1);

    }
    
}

    printf("Klient stop\n");

    print_poem();

}

void *server(void *arg) {

    printf("Serwer start\n");

    socklen_t address_length;
    struct sockaddr_in server_address;
    struct sockaddr_in client_address;
    int server_socket = socket(AF_INET, SOCK_STREAM, 0);
    int connection_socket;
    int32_t poem_line_number = POEM_LINE_CLIENT;
    int32_t poem_line_length = POEM_LINE_LENGHT;
    int status;

    server_address.sin_family = AF_INET;
    server_address.sin_addr.s_addr = INADDR_ANY;
    server_address.sin_port = htons(PORT);

    bind(server_socket,(struct sockaddr *)&server_address, sizeof(server_address));
    listen(server_socket, 5);  //listen for connections
    address_length = sizeof(client_address);

    //działaj dopóki nie zakończymy ręcznie
    while(stop < 0) {

        //printf("Server waiting for connection\n");
        connection_socket = accept(server_socket, (struct sockaddr *) &client_address, &address_length);

        if (connection_socket < 0) printf("Server ERROR on accept\n");

        getpeername(server_socket, (struct sockaddr *)&client_address, sizeof(struct sockaddr_in));
        char *clientip = (char*)malloc(20);
        inet_ntop(AF_INET, &client_address.sin_addr, clientip, 20);
        printf("SERVER - Successfully connected to client (%d): %s\n", server_socket, clientip);
        status = write(connection_socket, &poem_line_number, sizeof(int32_t) );
        if (status < 0) printf("Server number sent %d\n", poem_line_number);

        char buff[256];
        status = read(connection_socket, buff, 256);
        printf("Server got message %s\n", buff);

        if(buff[0] == 'y' || buff[0] == 'Y' ) {

            printf("Server sent poem line %s\n", POEM_LINE);

            status = write(connection_socket , &poem_line_length , sizeof(int32_t) );
            status = write(connection_socket , POEM_LINE , poem_line_length);

        }


        close(connection_socket);
        sleep(1);


    }

    close(server_socket);

    printf("Serwer stop\n");

}

int main() {

    for(int i = 0; i < POEM_LINE_NUM; i++) {

        numbers[i] = -1;

    }

    pthread_t client_thread;
    pthread_t server_thread;

    pthread_create(&client_thread, NULL, (void *)client, NULL);
    sleep(1);
    pthread_create(&server_thread, NULL, (void *)server, NULL);


    while(stop < 0) {

        getchar();
        stop = 1;
        sleep(3);
        print_poem();

    }

}


