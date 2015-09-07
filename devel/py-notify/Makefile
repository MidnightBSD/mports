# $MidnightBSD$
# $FreeBSD: ports/devel/py-notify/Makefile,v 1.8 2010/03/28 06:33:30 dinoex Exp $

PORTNAME=	notify
PORTVERSION=	0.1.1
DISTVERSIONPREFIX=python-
PORTREVISION=	3
CATEGORIES=	devel python
MASTER_SITES=	http://www.galago-project.org/files/releases/source/notify-python/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A python bindings for libnotify
LICENSE=	lgpl

LIB_DEPENDS=	notify:${PORTSDIR}/devel/libnotify

USES=		tar:bzip2 pkgconfig gmake
USE_GNOME=	pygtk2
USE_PYTHON=	2
GNU_CONFIGURE=	yes

DOCS=		AUTHORS COPYING ChangeLog NEWS

NO_STAGE=	yes
post-extract:
	@${RM} ${WRKSRC}/src/pynotify.c

.ifndef (NOPORTDOCS)
post-install:
	@${MKDIR} ${DOCSDIR}
.for i in ${DOCS}
	@${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
