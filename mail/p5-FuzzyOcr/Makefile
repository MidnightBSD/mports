# New ports collection makefile for:	FuzzyOcr
# Date Created:				8 Nov 2007
# Whom:					Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/mail/p5-FuzzyOcr/Makefile,v 1.1 2007/11/08 16:33:38 laffer1 Exp $
#

PORTNAME=	FuzzyOcr
DISTVERSION=	2.3b
PORTEPOCH=	1
CATEGORIES=	mail perl5
MASTER_SITES=	http://users.own-hero.net/~decoder/${PORTNAME:L}/	\
		http://mirror.inerd.com/FreeBSD/distfiles/${PORTNAME}/
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME:L}-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Plugin for SpamAssassin which scans image attachments for spam
LICENSE=        apache2
RUN_DEPENDS=	giftopnm:${PORTSDIR}/graphics/netpbm			\
		import:${PORTSDIR}/graphics/ImageMagick			\
		gocr:${PORTSDIR}/graphics/gocr				\
		gif2ps:${PORTSDIR}/graphics/libungif			\
		spamassassin:${PORTSDIR}/mail/p5-Mail-SpamAssassin	\
		${SITE_PERL}/${PERL_ARCH}/Digest/MD5.pm:${PORTSDIR}/security/p5-Digest-MD5	\
		${SITE_PERL}/${PERL_ARCH}/String/Approx.pm:${PORTSDIR}/devel/p5-String-Approx

USE_PERL5=	yes
WANT_PERL=	yes
NO_BUILD=	yes

WRKSRC=		${WRKDIR}/${PORTNAME}-${DISTVERSION}

PORTDOCS=	FAQ samples
PORTDOCS_F=	FAQ samples/README samples/animated-gif.eml		\
		samples/corrupted-gif.eml samples/jpeg.eml samples/png.eml

SUB_FILES=	pkg-message

#-----------------------------------------------------------------------
# The plugin is installed twice: once where it should go, and once where
# it actually works from. This will hopefully be fixed at some point.
#-----------------------------------------------------------------------

SA_PLUGINDIR?=	Mail/SpamAssassin/Plugin
SA_CONFIGDIR?=	etc/mail/spamassassin

PLIST_FILES=	${SA_CONFIGDIR}/FuzzyOcr.pm				\
		%%SITE_PERL%%/${SA_PLUGINDIR}/FuzzyOcr.pm		\
		%%EXAMPLESDIR%%/FuzzyOcr.cf %%EXAMPLESDIR%%/FuzzyOcr.words
PLIST_DIRS=	%%EXAMPLESDIR%% \
		%%SITE_PERL%%/${SA_PLUGINDIR} \
		%%SITE_PERL%% \
		${SA_CONFIGDIR}

post-patch:
	@${REINPLACE_CMD} -e 's,/usr/bin,${LOCALBASE}/bin,g'		\
	                  -e 's,/bin/grep,/usr/bin/grep,g'		\
	                  -e 's,/etc/mail,${LOCALBASE}/etc/mail,g'	\
	                  ${WRKSRC}/FuzzyOcr.??
	@${REINPLACE_CMD} -e 's,package FuzzyOcr;,package Mail::SpamAssassin::Plugin::FuzzyOcr;,'			\
	                 ${WRKSRC}/FuzzyOcr.pm
	@${REINPLACE_CMD} -e 's,loadplugin FuzzyOcr FuzzyOcr\.pm,loadplugin Mail::SpamAssassin::Plugin::FuzzyOcr,'	\
	                  ${WRKSRC}/FuzzyOcr.cf

do-install:
	${MKDIR} ${EXAMPLESDIR}
	${MKDIR} ${FAKE_DESTDIR}${SITE_PERL}/${SA_PLUGINDIR}
	${MKDIR} ${PREFIX}/${SA_CONFIGDIR}
	${INSTALL_DATA} ${WRKSRC}/FuzzyOcr.pm ${FAKE_DESTDIR}${SITE_PERL}/${SA_PLUGINDIR}
	${INSTALL_DATA} ${WRKSRC}/FuzzyOcr.pm ${PREFIX}/${SA_CONFIGDIR}
	${INSTALL_DATA} ${WRKSRC}/FuzzyOcr.cf ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/FuzzyOcr.words.sample ${EXAMPLESDIR}/FuzzyOcr.words

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}/samples
.  for f in ${PORTDOCS_F}
	${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}/${f}
.  endfor
.endif

.include <bsd.port.mk>
