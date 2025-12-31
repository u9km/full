// UserInfoManager.h
#ifndef USERINFOMANAGER_H // تضمن تضمين الملف مرة واحدة فقط
#define USERINFOMANAGER_H

#include <string>
#include <map>

class UserInfoManager {
public:
    // المُنشئ (Constructor) والمدمر (Destructor)
    UserInfoManager();
    ~UserInfoManager();

    // دوال للحصول على معلومات المستخدم
    std::string getUserId() const;
    std::string getUserEmail() const;
    std::string getDisplayName() const;
    // دالة للحصول على قيمة معينة بناءً على مفتاح (مفيد للإعدادات)
    std::string getConfigurationValue(const std::string& key) const;

    // دوال لتحديث معلومات المستخدم
    void updateUserProfile(const std::string& displayName, const std::string& email);
    void setConfigurationValue(const std::string& key, const std::string& value);

    // دوال للمصادقة والحالة (بناءً على سياق البحث)
    bool isUserLoggedIn() const;
    void refreshUserToken(); // مشابه لفكرة تجديد الرمز المميز (Token)[citation:1]
    void clearUserData(); // لمسح بيانات الجلسة

private:
    // المتغيرات الخاصة (بيانات العضو)
    std::string m_userId;
    std::string m_userEmail;
    std::string m_displayName;
    std::map<std::string, std::string> m_configurationMap; // لتخزين إعدادات/تفضيلات
    bool m_isAuthenticated;
    // ... يمكن إضافة المزيد مثل رمز الوصول (access token)[citation:1]
};

#endif // USERINFOMANAGER_H