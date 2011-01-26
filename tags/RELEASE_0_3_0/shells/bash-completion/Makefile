# $MidnightBSD: mports/shells/bash-completion/Makefile,v 1.4 2009/03/30 15:10:29 laffer1 Exp $

PORTNAME=	bash-completion
PORTVERSION=	20060301
PORTREVISION=	2
CATEGORIES=	shells
MASTER_SITES=	http://www.caliban.org/files/bash/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Programmable completion library for Bash
LICENSE=	unknown

WRKSRC=		${WRKDIR}/bash_completion
NO_BUILD=	yes

SUB_FILES=	pkg-message
PLIST_FILES=	etc/bash_completion

OPTIONS=	GSED	"Use GNU sed to enable additional completions"	off

.include <bsd.port.pre.mk>

RUN_DEPENDS+=	bash:${PORTSDIR}/shells/bash

.if defined(WITH_GSED)
RUN_DEPENDS+=	gsed:${PORTSDIR}/textproc/gsed
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|g; \
		s|/etc/bash_completion|${PREFIX}&|g; \
		s|/usr\(/sbin/postconf\)|${LOCALBASE}\1|g; \
		s|/usr\(/lib/rpm/macros\)|${LOCALBASE}\1|g; \
		s|/usr/share\(/ssl/openssl.cnf\)|/etc\1|g; \
		s|/usr/ports|${PORTSDIR}|g; \
		s|/usr/lib\(/aspell\)|${LOCALBASE}/share\1|g; \
		s|/usr/share/info|&:${LOCALBASE}/info|g; \
		s|\(FLAC\)|\1\|flv\|FLV|' \
		${WRKSRC}/bash_completion

do-install:
	${INSTALL_DATA} ${WRKSRC}/bash_completion ${PREFIX}/etc


.include <bsd.port.post.mk>
