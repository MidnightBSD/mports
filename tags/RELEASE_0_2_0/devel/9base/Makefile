# New ports collection makefile for:	9base
# Date created:		4 March 2007
# Whom:			Andrew Pantyukhin <infofarmer@FreeBSD.org>
#
# $MidnightBSD: mports/devel/9base/Makefile,v 1.1 2007/07/19 07:01:22 laffer1 Exp $
# $FreeBSD: ports/devel/9base/Makefile,v 1.2 2007/03/22 10:03:05 sat Exp $
#

PORTNAME=	9base
DISTVERSION=	b20060209
CATEGORIES=	devel
MASTER_SITES=	CENKES
#http://www.suckless.org/cgi-bin/hgwebdir.cgi/9base/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Port of various original plan9 tools
LICENSE=	agg

USE_BZIP2=	yes
CFLAGS+=	-I. -c
LDFLAGS+=	-L.
MANPREFIX=	${PREFIX}/9
MAKE_ARGS=	PREFIX="${PREFIX}/9" CC="${CC}" MANPREFIX="${MANPREFIX}/man" \
		CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"
APPS=	awk basename bc cat cleanname date dc echo grep ls mk rc read sed seq\
	sleep sort tee test touch tr uniq yacc
#MAN1=	${APPS:S|$|.1|}
PLIST_FILES=	${APPS:S|^|9/bin/|} ${APPS:S|^|9/man/man1/|:S|$|.1|} 9/man/man7/regexp.7 9/etc/rcmain
PLIST_DIRS=	9/bin 9/etc 9/man/man1 9/man/man7 9/man 9

post-patch:
	@${REINPLACE_CMD} -e 's|PREFIX|"${PREFIX}/9"|' ${WRKSRC}/rc/plan9ish.c
	@${REINPLACE_CMD} -e '/OBJTYPE!=/s|!=.*|=${ARCH:S,i386,386,:S,amd64,x86_64,:S,sparc64,sun4u,}|' ${WRKSRC}/lib9/Makefile

.include <bsd.port.mk>
