<?xml version="1.0" encoding="UTF-8"?>
<stylesheet version="1.0" xmlns="http://www.w3.org/1999/XSL/Transform">
    <output method="text" omit-xml-declaration="yes" indent="no"/>
    <template match="/">
      <variable name="benchmark-id" select="/*[local-name()='Benchmark']/@id" />
      <variable name="profile-id" select="/*[local-name()='Benchmark']/*[local-name()='TestResult']/*[local-name()='profile']/@idref" />
      <variable name="profile-title" select="/*[local-name()='Benchmark']/*[local-name()='Profile'][@id=$profile-id]/*[local-name()='title']" />
      <for-each select="*[local-name()='Benchmark']/*[local-name()='TestResult']">
        <for-each select="*[local-name()='rule-result']" xml:space="preserve">oscap: msg: "xccdf-result", title: "<value-of select="translate(/*[local-name()='Benchmark']//*[local-name()='Rule'][@id=current()/@idref]/*[local-name()='title'], '&#xA;', ' ')"/>", benchmark-id: "<value-of select="$benchmark-id" />", profile-id: "<if test="string-length($profile-id)=0">n/a</if><value-of select="$profile-id" />", profile-title: "<if test="string-length($profile-title)=0">n/a</if><value-of select="$profile-title" />", severity: "<value-of select="@severity"/>", result: "<value-of select="*[local-name()='result']"/>", id: "<value-of select="@idref"/>", oval: "<value-of select="*[local-name()='check']/*[local-name()='check-content-ref']/@name"/>", reference: "<for-each select="*[local-name()='ident']"><if test="position() > 1">,</if><value-of select="."/></for-each>".<text>
</text></for-each></for-each>oscap: msg: "xccdf-overview", benchmark-id: "<value-of select="$benchmark-id" />", profile-id: "<if test="string-length($profile-id)=0">n/a</if><value-of select="$profile-id" />", profile-title: "<if test="string-length($profile-title)=0">n/a</if><value-of select="$profile-title" />", score: "<value-of select="*[local-name()='Benchmark']/*[local-name()='TestResult']/*[local-name()='score']" />".
</template>
</stylesheet>
