# $MidnightBSD$ 
# $FreeBSD: ports/shells/osh/Makefile,v 1.17 2006/08/07 07:58:26 miwi Exp $

PORTNAME=	osh
DISTVERSION=	20150115
CATEGORIES=	shells
MASTER_SITES=	http://v6shell.org/src/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Implementation of the UNIX 6th Edition shell

LICENSE=	bsd4

FAKE_OPTS=	trueprefix

MAKE_ENV+=	DOCDIR=${DOCSDIR} \
		EXPDIR=${EXAMPLESDIR} \
		MANDIR=${MANPREFIX}/man/man1

PORTDOCS=	*
PORTEXAMPLES=	*
INSTALL_TARGET=	install install-doc install-exp
PLIST_SUB+=	VER=${DISTVERSION}

post-patch:
	@${REINPLACE_CMD} -E -e 's|(DESTEXPDIR)=|\1?=|' \
		${WRKSRC}/Makefile

.include <bsd.port.mk>
