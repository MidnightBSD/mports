# New ports collection makefile for:   mm
# Date Created:			14 March 1999
# Whom:				Ralf S. Engelschall
#
# $MidnightBSD$
# $FreeBSD: ports/devel/mm/Makefile,v 1.39 2007/07/23 09:35:43 rafan Exp $
#

PORTNAME=	mm
PORTVERSION=	1.4.2
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_OSSP}
MASTER_SITE_SUBDIR=	lib/${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Shared memory allocation library for pre-forked process models
LICENSE=	bsd4

USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=--build=${MACHINE_ARCH}-portbld-freebsd6.0

MAN1=		mm-config.1
MAN3=		mm.3

post-build:
	@${ECHO_MSG} "===>  Use 'make test' to run a quick test suite."

test:
	@cd ${WRKSRC} && ${MAKE} test

.include <bsd.port.mk>
