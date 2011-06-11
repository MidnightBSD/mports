# $MidnightBSD$
# $FreeBSD: ports/devel/py-notify/Makefile,v 1.8 2010/03/28 06:33:30 dinoex Exp $

PORTNAME=	notify
PORTVERSION=	0.1.1
DISTVERSIONPREFIX=python-
CATEGORIES=	devel python
MASTER_SITES=	http://www.galago-project.org/files/releases/source/notify-python/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A python bindings for libnotify
LICENSE=	lgpl

LIB_DEPENDS=	notify.1:${PORTSDIR}/devel/libnotify

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack gnometarget pygtk2
USE_PYTHON=	yes
GNU_CONFIGURE=	yes

DOCS=		AUTHORS COPYING ChangeLog NEWS

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
