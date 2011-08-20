# $MidnightBSD: mports/devel/mm/Makefile,v 1.2 2009/03/25 22:02:47 laffer1 Exp $

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
CONFIGURE_TARGET=	 ${MACHINE_ARCH}-portbld-freebsd7.0

MAN1=		mm-config.1
MAN3=		mm.3

post-build:
	@${ECHO_MSG} "===>  Use 'make test' to run a quick test suite."

test:
	@cd ${WRKSRC} && ${MAKE} test

.include <bsd.port.mk>
