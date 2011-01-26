# New ports collection makefile for:    pam_ldap
# Date created:				26 May 2001
# Whom:	      				Joe Clarke <marcus@marcuscom.com>
#
# $MidnightBSD: mports/security/pam_ldap/Makefile,v 1.3 2007/10/18 22:29:26 laffer1 Exp $
# $FreeBSD: ports/security/pam_ldap/Makefile,v 1.38 2006/07/09 06:51:06 marcus Exp $
#

PORTNAME=	pam_ldap
PORTVERSION=	1.8.4
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
WRKSRC=	${WRKDIR}/${PORTNAME}-${PORTVERSION:S/.//g}
CONFIGURE_ARGS=	--with-ldap-lib=openldap \
		--with-ldap-dir=${LOCALBASE} \
		--with-ldap-conf-file=${PREFIX}/etc/ldap.conf \
		--with-ldap-secret-file=${PREFIX}/etc/ldap.secret
CONFIGURE_TARGET=--build=${MACHINE_ARCH}-unknown-freebsd6.0 \
		--host=${MACHINE_ARCH}-unknown-freebsd6.0 \
		--target=${MACHINE_ARCH}-unknown-freebsd6.0

PKGMESSAGE=	${WRKDIR}/pkg-message

MAN5=		pam_ldap.5

post-extract:
	@${FIND} ${WRKSRC} -type f | ${XARGS} ${TOUCH} -f

post-install:
	@${SED} -e 's|%%PREFIX%%|${TRUE_PREFIX}|g' < ${PKGDIR}/pkg-message \
		| /usr/bin/fmt 75 79 > ${PKGMESSAGE}

.include <bsd.port.mk>
