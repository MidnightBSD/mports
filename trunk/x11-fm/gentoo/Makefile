# New ports collection makefile for:	gentoo
# Date created:				12 August 2001
# Whom:					Anders Nordby <anders@fix.no>
#
# $MidnightBSD: mports/x11-fm/gentoo/Makefile,v 1.4 2008/08/24 19:44:14 laffer1 Exp $
# $FreeBSD: ports/x11-fm/gentoo/Makefile,v 1.52 2006/08/28 12:01:16 miwi Exp $
#

PORTNAME=	gentoo
PORTVERSION=	0.11.57
PORTREVISION=	1
CATEGORIES=	x11-fm
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gtk+ based, file manager inspired by DirectoryOpus
LICENSE=	gpl2

OPTIONS=	NLS "Native Language Support" on \
		FAM "File Alteration Monitor Support" off

USE_GNOME=	 gtk12
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}"

MAN1=		gentoo.1

CPPFLAGS=	-I${LOCALBASE}/include
LDFLAGS=	-L${LOCALBASE}/lib

.include <bsd.port.pre.mk>

MYPORTDOCS=	BUGS CONFIG-CHANGES CREDITS NEWS README README.NLS \
		README.gtkrc TODO

.if defined(WITHOUT_NLS)
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=	NLS="@comment "
.else
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.endif

.if defined(WITH_FAM)
USE_FAM=	yes
CPPFLAGS+=	${PTHREAD_CFLAGS}
LDFLAGS+=	${PTHREAD_LIBS}
.else
CONFIGURE_ARGS+=	--disable-fam
.endif

post-patch:
	@${FIND} ${WRKSRC} -name "Makefile.in*" | ${XARGS} ${REINPLACE_CMD} -e \
		's|^CFLAGS = @GENTOO_CFLAGS@|CFLAGS = @CFLAGS@|g ; \
		 s|^mkinstalldirs =.*$$|mkinstalldirs = $$(SHELL) $$(top_srcdir)/mkinstalldirs|g'
	${CHMOD} 755 ${WRKSRC}/install-sh

post-install:
	${INSTALL_MAN} ${WRKSRC}/docs/gentoo.1x ${MANPREFIX}/man/man1/gentoo.1
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for file in ${MYPORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}
.endfor
	${TAR} -C ${WRKSRC}/docs --exclude "gentoo.1x*" -cf - . | \
		${TAR} -C ${DOCSDIR} --unlink -xf -
	@${FIND} ${DOCSDIR} | ${XARGS} ${CHOWN} ${SHAREOWN}:${SHAREGRP}
	@${FIND} ${DOCSDIR} | ${XARGS} ${CHMOD} ${SHAREMODE}
	@${FIND} ${DOCSDIR} -type d | ${XARGS} ${CHMOD} a+x
.endif

.include <bsd.port.post.mk>
