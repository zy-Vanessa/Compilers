#ifndef SYMBOLTABLE_H
#define SYMBOLTABLE_H

#include <string>
#include <unordered_map>
#include <any>

class SymbolTable {
    std::unordered_map<std::string, double> symbolTable;
public:
    bool search(std::string identifier);
    void insert(std::string identifier, double value);
    double getValue(std::string identifier);
    void printAll();
};
#endif //SYMBOLTABLE_H