#include<stdio.h>
#include<stdlib.h>
struct node {
    struct node* nxt;
    long long factor;
    int pos;
};

void insert(struct node *A, struct node *head) {
    struct node *curr = head;
    while(curr->nxt->pos < A->pos) {
        curr = curr->nxt;
    }
    struct node* tmp = curr->nxt;
    curr->nxt = A;
    A->nxt = tmp;
}

int main() {
    char str[20000];
    scanf("%s", str);
    long long sum = 0;
    struct node* head = (struct node *)malloc(sizeof(struct node));
    struct node* tail = (struct node *)malloc(sizeof(struct node));
    head->pos = -1;
    head->factor = 1;
    head->nxt = tail;
    tail->pos = 100000;
    tail->factor = 1;
    tail->nxt = NULL;
    long long factor = 1;
    for(int i = 0; ; i++) {
        if(str[i] == '\0') break;

        while(i == head->nxt->pos) {
            factor = factor/(head->nxt->factor);
            struct node* rm = head->nxt;
            head->nxt = head->nxt->nxt;
            free(rm);
        }

        if(str[i] == '(') {
            i++;
            int l = 0;
            while(str[i] != 'x') {
                l = 10*l + (str[i] - '0');
                i++;
            }
            i++;
            int fac = 0;
            while(str[i] != ')') {
                fac = 10*fac + (str[i] - '0');
                i++;
            }
            struct node* nxt = (struct node *)malloc(sizeof(struct node));
            nxt->factor = fac;
            nxt->pos = i + l + 1;
            factor = factor*fac;
            insert(nxt, head);
        } else {
            sum += factor;
        }
    }
    printf("%lld\n", sum);
}
