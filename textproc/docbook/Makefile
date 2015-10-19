# $MidnightBSD$
# $FreeBSD: ports/textproc/docbook/Makefile,v 1.22 2007/01/15 15:11:11 alepulver Exp $

PORTNAME=	docbook
PORTVERSION=	1.5
CATEGORIES=	textproc
MASTER_SITES=	#
DISTFILES=	#

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Meta-port for the different versions of the DocBook DTD

LICENSE=	unknown

RUN_DEPENDS=	${LOCALBASE}/share/sgml/docbook/catalog:${PORTSDIR}/textproc/docbook-sgml \
		${LOCALBASE}/share/xml/docbook/catalog.xml:${PORTSDIR}/textproc/docbook-xml \
		sdocbook-xml>0:${PORTSDIR}/textproc/sdocbook-xml

NO_BUILD=	yes

.include <bsd.port.pre.mk>

do-install:
	@${DO_NADA}

.include <bsd.port.post.mk>
