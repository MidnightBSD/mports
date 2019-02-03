# $MidnightBSD$
# $FreeBSD: head/security/cyrus-sasl2-ldapdb/Makefile 409943 2016-03-02 14:13:45Z ume $

PKGNAMESUFFIX=	-ldapdb
PORTREVISION=	5

COMMENT=	SASL LDAPDB auxprop plugin

CYRUS_CONFIGURE_ARGS=	--enable-ldapdb --with-ldap=${LOCALBASE}

USES+=	ldap
USE_OPENLDAP=	yes
.if defined(WITH_OPENLDAP_VER)
WANT_OPENLDAP_VER=	${WITH_OPENLDAP_VER}
.endif

.include "${.CURDIR}/../../security/cyrus-sasl2/Makefile.common"
