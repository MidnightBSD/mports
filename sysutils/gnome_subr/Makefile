# $MidnightBSD$
# $FreeBSD: ports/sysutils/gnome_subr/Makefile,v 1.1 2006/10/31 09:08:29 jylefort Exp $

PORTNAME=	gnome_subr
PORTVERSION=	1.0
CATEGORIES=	sysutils
DISTFILES=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Common startup and shutdown subroutines used by GNOME scripts

LICENSE=	bsd2

NO_BUILD=	yes
PLIST_FILES=	etc/gnome.subr

do-install:
	${INSTALL_DATA} ${FILESDIR}/gnome.subr ${PREFIX}/etc

.include <bsd.port.mk>
