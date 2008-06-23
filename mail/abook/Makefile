# New ports collection makefile for:	abook
# Date created:				June 6th 2000
# Whom:	      				Yen-Ming Lee <leeym@cae.ce.ntu.edu.tw>
#
# $MidnightBSD: mports/mail/abook/Makefile,v 1.3 2007/12/05 23:06:43 laffer1 Exp $
# $FreeBSD: ports/mail/abook/Makefile,v 1.21 2006/08/10 01:30:07 clsung Exp $
#

PORTNAME=	abook
PORTVERSION=	0.5.6
CATEGORIES=	mail
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An addressbook program with mutt mail client support
LICENSE=	gpl2

GNU_CONFIGURE=	yes
USE_GNOME=	gnometarget
CFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ENV+=	CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"

.if defined(WITHOUT_NLS)
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.else
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.endif

MAN1=		abook.1
MAN5=		abookrc.5
PORTDOCS=	ANNOUNCE AUTHORS BUGS ChangeLog FAQ INSTALL NEWS README \
		THANKS TODO

.include <bsd.port.pre.mk>

.if exists(${LOCALBASE}/lib/libreadline.so.5)
LIB_DEPENDS+=	readline.5:${PORTSDIR}/devel/readline
.endif

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}
.endif

.include <bsd.port.post.mk>
