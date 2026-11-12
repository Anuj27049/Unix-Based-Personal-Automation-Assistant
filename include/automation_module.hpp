
#ifndef AUTOMATION_MODULE_HPP
#define AUTOMATION_MODULE_HPP

#include <string>

class AutomationModule {
private:
    std::string moduleName;
    std::string description;

protected:
bool runScript(const std::string& scriptPath);
public:
    AutomationModule(const std::string& name,
                     const std::string& description);

    virtual void execute() = 0;

    void displayInfo() const;

    const std::string& getName() const;

    virtual ~AutomationModule() = default;
};

#endif

