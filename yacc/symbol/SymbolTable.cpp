#include <iostream>
#include <cfloat>
#include "SymbolTable.h"

bool SymbolTable::search(std::string identifier)
{
    if(symbolTable.find(identifier) == symbolTable.end()){
        // 没有找到对应的id
        return false;
    }
    return true;
}

void SymbolTable::insert(std::string identifier, double value)
{
    auto res = symbolTable.insert(std::pair<std::string, double>(identifier, value));
    if(res.second){ //检查插入是否成功
        std::cout << "Insert " << identifier << " = " << value << std::endl;
    }
    else{ //更新标识符对应的值
        std::cout << "Update " << identifier << ":" << symbolTable[identifier] << "->" << value << std::endl;
        symbolTable[identifier] = value;
    }
    printAll();
}

double SymbolTable::getValue(std::string identifier)
{
    if(symbolTable.find(identifier) == symbolTable.end()) {
        return DBL_MIN;
    }
    return symbolTable.find(identifier)->second;
}

void SymbolTable::printAll()
{
    std::cout << "print_table_begin" << std::endl;
    for (auto &item : symbolTable){
        std::cout << item.first << " = " << item.second << std::endl;
    }
    std::cout << "print_table_end" << std::endl;
    std::cout << std::endl;
}