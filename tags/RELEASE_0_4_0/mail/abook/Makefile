# $MidnightBSD: mports/mail/abook/Makefile,v 1.5 2009/09/24 01:02:15 laffer1 Exp $

PORTNAME=	abook
PORTVERSION=	0.5.6
PORTREVISION=	1
CATEGORIES=	mail
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An addressbook program with mutt mail client support
LICENSE=	gpl2

GNU_CONFIGURE=	yes
USE_GNOME=	
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

.if exists(${LOCALBASE}/lib/libreadline.so.6)
LIB_DEPENDS+=	readline.6:${PORTSDIR}/devel/readline
.endif

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}
.endif

.include <bsd.port.post.mk>
