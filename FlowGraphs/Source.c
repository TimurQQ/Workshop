#include <stdlib.h>
#include "graph.h"

string startMenu[] = {
	"0.������� ������ ����",
	"1.������� ��������� ����",
	"2.��������� ���� �� �����",
	"3.�����"
};

string graphMenu[] = {
	"0.�������� ������� � ����",
	"1.������� ������� �����",
	"2.�������� ����� � ����",
	"3.���������� ������������ ������������������",
	"4.���������� �������",
	"5.������� ���� � �������",
	"6.����� � ��������� ����",
	"7.�����"
};

void(*startMenuFunctions[])(Graph*) = {
	D_Create_Graph,
	D_Random_Graph,
	D_Load_Graph,
	NULL
};

void(*graphMethods[])(Graph*) = {
	D_Add_Node,
	D_Del_Node,
	D_Add_Connection,
	D_Max_Product,
	D_Find_Path,
	D_Print_Graph,
	NULL,
	NULL
};

void setRusLang(void) {
	system("chcp 1251 && cls");
}

int startDialog(void) {
	int n, funcNumber = 3;
	string errmsg = "";
	do {
		puts(errmsg);
		errmsg = "�������� ��������.��������� ����!\n";
		for (int i = 0; i < sizeof(startMenu) / sizeof(startMenu[0]); i++) {
			printf("%s\n", startMenu[i]);
		}
		printf("�������� ����� ����: --> ");
		n = getInt(&funcNumber);
	} while (funcNumber < 0 || funcNumber > 4);
	return funcNumber;
}

int graphDialog(void) {
	int n, funcNumber = 7;
	string errmsg = "";
	do {
		puts(errmsg);
		errmsg = "�������� ��������.��������� ����!\n";
		for (int i = 0; i < sizeof(graphMenu) / sizeof(graphMenu[0]); i++) {
			printf("%s\n", graphMenu[i]);
		}
		printf("�������� ����� ����: --> ");
		n = getInt(&funcNumber);
	} while (funcNumber < 0 || funcNumber > 7);
	return funcNumber;
}

int main(void) {
	int funcNumber;
	setRusLang();
	do {
		Graph* graph = makeGraph();
		funcNumber = startDialog();
		if (funcNumber == 3) {
			free(graph);
			return 0;
		}
		startMenuFunctions[funcNumber](graph);
		while ((funcNumber = graphDialog()) < 6) {
			if (funcNumber <= 2) {
				fprintf(graph->fd, "%d;", funcNumber);
			}
			graphMethods[funcNumber](graph);
		}
		fclose(graph->fd);
		free(graph);
		if (funcNumber == 7) return 0;
	} while (1);
	return 0;
}