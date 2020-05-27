#pragma once

#include <stdio.h>
#include <malloc.h>
#include <string.h>

typedef char* string;

typedef struct Connection {
	string to_name;
	int weight;
	struct Connection* next;
	struct Connection* prev;
	struct Connection* tConnect;
} Connection;

typedef struct Node {
	string nodeName;
	Connection* Adj;
	struct Node* next;
	struct Node* prev;
} Node;

typedef struct Graph {
	Node* nodes;
	FILE* fd;
	string fname;
} Graph;

#define TRUE 1
#define FALSE 0
#define STDIO 0
#define FILEIO 1

int getInt(int* n);
string getStrFromFile(FILE* fd);
string getStr(const string pattern);

void D_Create_Graph(Graph*);
void D_Random_Graph(Graph*);
void D_Load_Graph(Graph*);

void D_Add_Node(Graph*);
void D_Del_Node(Graph*);
void D_Add_Connection(Graph*);
void D_Max_Product(Graph*);
void D_Find_Path(Graph*);
void D_Print_Graph(Graph*);

int getConnection(string* A, string* B, int* w);
Graph* makeGraph(void);
void addNode(Graph* graph, string nodeName);
Node* findNode(Graph* graph, string nodeName);
void findPair(Graph* graph, string A, string B, Node** nodeA, Node** nodeB);
Connection* findConnection(Node* node, string to_name);
void addConnection(Graph* graph, string A, string B, int w);
void printConnections(Node* node);
void printGraph(Graph* graph);
void deleteConnection(Graph* graph, string nodeName, Connection* connection);
void deleteNode(Graph* graph, string nodeName);
void loadGraph(Graph* graph);
