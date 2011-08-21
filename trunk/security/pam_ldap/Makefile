# $MidnightBSD: mports/security/pam_ldap/Makefile,v 1.4 2008/05/22 22:14:51 laffer1 Exp $
# $FreeBSD: ports/security/pam_ldap/Makefile,v 1.38 2006/07/09 06:51:06 marcus Exp $

PORTNAME=	pam_ldap
PORTVERSION=	1.8.6
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
CONFIGURE_ARGS=	--with-ldap-lib=openldap \
		--with-ldap-dir=${LOCALBASE} \
		--with-ldap-conf-file=${PREFIX}/etc/ldap.conf \
		--with-ldap-secret-file=${PREFIX}/etc/ldap.secret
CONFIGURE_TARGET=	${MACHINE_ARCH}-unknown-freebsd7.0

PKGMESSAGE=	${WRKDIR}/pkg-message

MAN5=		pam_ldap.5

#post-extract:
#	@${FIND} ${WRKSRC} -type f | ${XARGS} ${TOUCH} -f

post-install:
	@${SED} -e 's|%%PREFIX%%|${TRUE_PREFIX}|g' < ${PKGDIR}/pkg-message \
		| /usr/bin/fmt 75 79 > ${PKGMESSAGE}

.include <bsd.port.mk>
