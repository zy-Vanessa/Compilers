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
        std::cout << "Insert " << identifier << "=" << value <<" success!" << std::endl;
    }
    else{ //更新id对应的值
        std::cout << "Update " << identifier << ":" << symbolTable[identifier] << "->" << value << " success!" << std::endl;
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
    for (auto &item : symbolTable){
        std::cout << item.first << " = " << item.second << std::endl;
    }
}