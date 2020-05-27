#define _CRT_SECURE_NO_WARNINGS
#include "graph.h"

int getInt(int* n) {
	int k = scanf_s("%d", n);
	int p = scanf_s("%*c");
	return k > 0;
}

string getStrFromFile(FILE* fd) {
	char buf[81];
	buf[80] = '\0';
	string s = (string)malloc(1);
	if (s == NULL) {
		return NULL;
	}
	*s = '\0';
	while (fscanf(fd, "%80[^;]", buf)) {
		string tmp = s;
		s = realloc(s, strlen(s) + strlen(buf) + 1);
		if (s == NULL) {
			s = tmp;
		}
		strcat(s, buf);
	}
	char tmp;
	int n = fscanf(fd, "%c", &tmp);
	return s;
}

int getIntFromFile(FILE* fd, int* res) {
	int n = fscanf(fd, "%d", res);
	char tmp;
	int k = fscanf(fd, "%c", &tmp);
	return n > 0;
}

string getStr(const string pattern) {
	char buf[81];
	buf[80] = '\0';
	string s = (string)malloc(1);
	if (s == NULL) {
		return NULL;
	}
	*s = '\0';
	while (scanf(pattern, buf)) {
		string tmp = s;
		s = realloc(s, strlen(s) + strlen(buf) + 1);
		if (s == NULL) {
			s = tmp;
		}
		strcat(s, buf);
	}
	int n = scanf("%*c");
	return s;
}

void D_Create_Graph(Graph* graph) {
	graph->fd = fopen(graph->fname, "w+");
}

void D_Random_Graph(Graph* graph) {

}

void D_Load_Graph(Graph* graph) {
	graph->fd = fopen(graph->fname, "r+");
	loadGraph(graph);
	puts("done");
}

void D_Add_Node(Graph* graph) {
	string nodeName = getStr("%80[^\n]");
	fprintf(graph->fd, "%s;", nodeName);
	addNode(graph, nodeName);
	puts("done");
}

void D_Del_Node(Graph* graph) {
	string nodeName = getStr("%80[^\n]");
	fprintf(graph->fd, "%s;", nodeName);
	deleteNode(graph, nodeName);
	puts("done");
}

void D_Add_Connection(Graph* graph) {
	string A, B;
	int w;
	getConnection(&A, &B, &w);
	fprintf(graph->fd, "%s;%s;%d;", A, B, w);
	addConnection(graph, A, B, w);
	puts("done");
}

void D_Max_Product(Graph* graph) {

}

void D_Find_Path(Graph* graph) {

}

void D_Print_Graph(Graph* graph) {
	printGraph(graph);
	puts("done");
}

int getConnection(string* A, string* B, int* w) {
	*A = getStr("%80[^ ]");
	*B = getStr("%80[^ ]");
	int n = getInt(w);
	return n > 0;
}

Graph* makeGraph(void) {
	Graph* newGraph = (Graph*)malloc(sizeof(Graph));
	if (newGraph == NULL) {
		return NULL;
	}
	*newGraph = (Graph){ NULL, NULL, "graph.txt" };
	return newGraph;
}

void addNode(Graph* graph, string nodeName) {
	Node* newNode = (Node*)malloc(sizeof(Node));
	if (newNode == NULL) {
		return;
	}
	*newNode = (Node){ nodeName, NULL, NULL, NULL };
	if (graph->nodes == NULL) {
		graph->nodes = newNode;
	}
	else {
		newNode->next = graph->nodes;
		graph->nodes->prev = newNode;
		graph->nodes = newNode;
	}
}

Node* findNode(Graph* graph, string nodeName) {
	for (Node* ptr = graph->nodes; ptr; ptr = ptr->next) {
		if (strcmp(ptr->nodeName ,nodeName) == 0) {
			return ptr;
		}
	}
	return NULL;
}

void findPair(Graph* graph, string A, string B, Node** nodeA, Node** nodeB) {
	for (Node* ptr = graph->nodes; ptr; ptr = ptr->next) {
		if (strcmp(ptr->nodeName, A) == 0) {
			*nodeA = ptr;
		}
		if (strcmp(ptr->nodeName, B) == 0) {
			*nodeB = ptr;
		}
	}
}

Connection* findConnection(Node* node, string to_name) {
	for (Connection* ptr = node->Adj; ptr; ptr = ptr->next) {
		if (strcmp(ptr->to_name, to_name) == 0) {
			return ptr;
		}
	}
	return NULL;
}

void addConnection(Graph* graph, string A, string B, int w) {
	Node* nodeA, * nodeB;
	findPair(graph, A, B, &nodeA, &nodeB);
	Connection* newConnectionA = (Connection*)malloc(sizeof(Connection));
	if (newConnectionA == NULL) {
		return;
	}
	*newConnectionA = (Connection){ B, w, nodeA->Adj, NULL, NULL};
	if (nodeA->Adj != NULL) {
		nodeA->Adj->prev = newConnectionA;
	}
	nodeA->Adj = newConnectionA;
	Connection* newConnectionB = (Connection*)malloc(sizeof(Connection));
	if (newConnectionB == NULL) {
		return;
	}
	*newConnectionB = (Connection){ A, -w, nodeB->Adj, NULL , NULL};
	if (nodeB->Adj != NULL) {
		nodeB->Adj->prev = newConnectionB;
	}
	nodeB->Adj = newConnectionB;
	newConnectionA->tConnect = newConnectionB;
	newConnectionB->tConnect = newConnectionA;
}

void printConnections(Node* node) {
	for (Connection* ptr = node->Adj; ptr; ptr = ptr->next) {
		printf("(%s %d)|", ptr->to_name, ptr->weight);
	}
}

void printGraph(Graph* graph) {
	for (Node* ptr = graph->nodes; ptr; ptr = ptr->next) {
		printf("%s ->|", ptr->nodeName);
		printConnections(ptr);
		printf("\n");
	}
}

void deleteConnection(Graph* graph, string nodeName, Connection* connection) {
	if (connection->prev == NULL) {
		if (connection->next != NULL) {
			Connection* toDelete = connection->next;
			connection->to_name = _strdup(toDelete->to_name);
			connection->weight = toDelete->weight;
			connection->tConnect = toDelete->tConnect;
			if (connection->next->next != NULL) {
				connection->next->next->prev = connection;
			}
			connection->next = connection->next->next;
			free(toDelete);
		}
		else {
			Node* node = findNode(graph, nodeName);
			free(node->Adj);
			node->Adj = NULL;
		}
	}
	else {
		connection->prev->next = connection->next;
		if (connection->next != NULL) {
			connection->next->prev = connection->prev;
		}
	}
}

void deleteNode(Graph* graph, string nodeName) {
	Node* curNode = findNode(graph, nodeName);
	for (Connection* ptr = curNode->Adj; ptr; ptr = ptr->next) {
		deleteConnection(graph, ptr->to_name, ptr->tConnect);
	}
	if (curNode == graph->nodes) {
		if (curNode->next != NULL) {
			curNode->next->prev = NULL;
		}
		graph->nodes = curNode->next;
	}
	else {
		curNode->prev->next = curNode->next;
		if (curNode->next != NULL) {
			curNode->next->prev = curNode->prev;
		}
	}
	free(curNode);
}

void loadGraph(Graph* graph) {
	int funcNumber;
	while (getIntFromFile(graph->fd, &funcNumber)) {
		switch (funcNumber) {
		case 0: {
			string nodeName = getStrFromFile(graph->fd);
			addNode(graph, nodeName);
		}
			  break;
		case 1: {
			string nodeName = getStrFromFile(graph->fd);
			deleteNode(graph, nodeName);
		}
			  break;
		case 2: {
			string A = getStrFromFile(graph->fd);
			string B = getStrFromFile(graph->fd);
			int w;
			getIntFromFile(graph->fd, &w);
			addConnection(graph, A, B, w);
		}
		}
	}
}