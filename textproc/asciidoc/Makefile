# $MidnightBSD$

PORTNAME=	asciidoc
PORTVERSION=	8.6.1
CATEGORIES=	textproc
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A text document format for writing short documents and man pages
LICENSE=	gpl2

USE_PYTHON=	2.4+
USE_GMAKE=	yes
MAKE_ENV=	INSTALL="${INSTALL}" INSTALL_PROGRAM="${INSTALL_PROGRAM}" \
		INSTALL_SCRIPT="${INSTALL_SCRIPT}" INSTALL_DATA="${INSTALL_DATA}"

GNU_CONFIGURE=	yes
MAN1=		a2x.1 asciidoc.1

.include <bsd.port.mk>
