# $MidnightBSD$

PORTNAME=	pam_ldap
PORTVERSION=	1.8.6
PORTREVISION=	1
CATEGORIES=	security net
MASTER_SITES=	http://www.padl.com/download/ \
		ftp://ftp.padl.com/pub/
DISTNAME=	pam_ldap-${PORTVERSION:S/.//g}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A pam module for authenticating with LDAP

LICENSE=	gpl2

USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_OPENLDAP=	yes
USE_PERL5_BUILD=	yes
WRKSRC=	${WRKDIR}/${PORTNAME}-${PORTVERSION:S/.//g}
PAM_LDAP_CONF?=	ldap.conf
CONFIGURE_ARGS=	--with-ldap-lib=openldap \
		--with-ldap-dir=${LOCALBASE} \
		--with-ldap-conf-file=${PREFIX}/etc/${PAM_LDAP_CONF} \
		--with-ldap-secret-file=${PREFIX}/etc/ldap.secret

PKGMESSAGE=	${WRKDIR}/pkg-message
PORTDATA=	*.schema

MAN5=		pam_ldap.5

pre-install:
	@${MKDIR} ${DATADIR}

post-install:
	@${INSTALL_DATA} ${WRKSRC}/*.schema ${DATADIR}
	@${SED} -e 's|%%PREFIX%%|${TRUE_PREFIX}|g' \
	    	-e 's|%%DATADIR%%|${DATADIR}|' < ${PKGDIR}/pkg-message \
		| /usr/bin/fmt 75 79 > ${PKGMESSAGE}

.include <bsd.port.mk>
