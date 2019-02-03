# $MidnightBSD$
# $FreeBSD: ports/net/linux-f10-openldap/Makefile,v 1.3 2011/03/03 09:26:42 ehaupt Exp $

PORTNAME=	openldap
PORTVERSION=	2.4.12
PORTREVISION=	2
CATEGORIES=	net linux
MASTER_SITES=	FREEBSD_LOCAL/ehaupt/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
PKGNAMEPREFIX=	linux-f10-
DISTNAME=	${PORTNAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight Directory Access Protocol libraries (Linux Fedora 10)
LICENSE=	openldap2.8

USE_LINUX=	f10
USE_LINUX_RPM=	yes

RPMVERSION=	1.fc10
USE_LDCONFIG=	yes
DESCR=	${.CURDIR}/../openldap24-server/pkg-descr

PLIST_FILES=	usr/lib/liblber-2.4.so.2 usr/lib/liblber-2.4.so.2.2.0 usr/lib/libldap-2.4.so.2 usr/lib/libldap-2.4.so.2.2.0 usr/lib/libldap_r-2.4.so.2 usr/lib/libldap_r-2.4.so.2.2.0 etc/openldap usr/share/man/man5/ldap.conf.5.gz usr/share/man/man5/ldif.5.gz
DOCSDIR=	usr/share/doc/${PORTNAME}-${PORTVERSION}
PORTDOCS=	ANNOUNCEMENT CHANGES COPYRIGHT LICENSE README

# do not install any openldap configuration directories/files
post-extract:
	${RM} -rf ${WRKSRC}/etc

# use a native openldap configuration directories/files
post-install:
	${MKDIR} ${PREFIX}/etc
	${LN} -sf ${LOCALBASE}/etc/openldap ${PREFIX}/etc/openldap

.include <bsd.port.mk>
