# $MidnightBSD$
# $FreeBSD: ports/devel/cscope/Makefile,v 1.27 2006/11/01 11:23:29 miwi Exp $

PORTNAME=	cscope
PORTVERSION=	15.8a
CATEGORIES=	devel
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Interactive C program browser

LICENSE=	bsd3

OPTIONS_DEFINE=	XCSCOPE
XCSCOPE_DESC=	Install (X)Emacs package

GNU_CONFIGURE=	yes

EMACSLISPDIR=	${PREFIX}/share/emacs/site-lisp
XEMACSLISPDIR=	${PREFIX}/lib/xemacs/site-lisp

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MXCSCOPE}
PLIST_SUB+=	XCSCOPE=""
post-install:
	${INSTALL_SCRIPT} ${WRKSRC}/contrib/xcscope/cscope-indexer ${PREFIX}/bin
	${MKDIR} ${EMACSLISPDIR}
	${INSTALL_DATA} ${WRKSRC}/contrib/xcscope/xcscope.el ${EMACSLISPDIR}
	${MKDIR} ${XEMACSLISPDIR}
	${LN} -sf ${EMACSLISPDIR}/xcscope.el ${XEMACSLISPDIR}
.else
PLIST_SUB+=	XCSCOPE="@comment "
.endif

.include <bsd.port.mk>
