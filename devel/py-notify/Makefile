# $MidnightBSD$
# $FreeBSD: ports/devel/py-notify/Makefile,v 1.8 2010/03/28 06:33:30 dinoex Exp $

PORTNAME=	notify
PORTVERSION=	0.1.1
DISTVERSIONPREFIX=python-
PORTREVISION=	4
CATEGORIES=	devel python
MASTER_SITES=	http://www.galago-project.org/files/releases/source/notify-python/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings for libnotify

LICENSE=	lgpl

OPTIONS_DEFINE=	DOCS

LIB_DEPENDS=	libnotify.so:${PORTSDIR}/devel/libnotify

USES=		gmake libtool:keepla pathfix pkgconfig python:2 tar:bzip2
USE_GNOME=	pygtk2
INSTALL_TARGET=	install-strip
GNU_CONFIGURE=	yes

DOCS=		AUTHORS COPYING ChangeLog NEWS

post-extract:
	@${RM} ${WRKSRC}/src/pynotify.c

post-install:
	@${MKDIR} ${DOCSDIR}
.for i in ${DOCS}
	@${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor

.include <bsd.port.mk>
