PORTNAME=	texi2html
PORTVERSION=	5.0
PORTREVISION=	3
PORTEPOCH=	1
CATEGORIES=	textproc
MASTER_SITES=	SAVANNAH

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Texinfo to HTML converter
WWW=		https://www.nongnu.org/texi2html/

LICENSE=        gpl2

GNU_CONFIGURE=	yes
CONFIGURE_ENV=	PERL=${PERL}
CONFIGURE_ARGS=	--disable-multiplatform
USES=		gettext-tools:build gmake perl5 shebangfix tar:bzip2
SHEBANG_FILES=	*.pl

OPTIONS_DEFINE=	NLS DOCS
OPTIONS_SUB=	yes

NLS_CONFIGURE_ENABLE=nls translations

PROGRAM_PREFIX?=
PLIST_SUB=	PROGRAM_PREFIX=${PROGRAM_PREFIX} \
		TEXINFODIR=share/texinfo

.if !empty(PROGRAM_PREFIX)
CONFIGURE_ARGS=	--program-prefix="${PROGRAM_PREFIX}"
.endif

INFO=		texi2html

.include <bsd.mport.options.mk>

pre-everything::
	@${ECHO} ""
	@${ECHO} "You can define the PROGRAM_PREFIX variable to change the name that"
	@${ECHO} "the texi2html program is installed as."
	@${ECHO} ""

post-patch:
	@${REINPLACE_CMD} -e 's/^translations.pl/_&/' ${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e '/^install-data/s|i18n|&/en.thl|' ${WRKSRC}/Makefile.in
.if empty(PORT_OPTIONS:MDOCS)
	@${REINPLACE_CMD} -e 's| install-texinfohtmlDATA||g' ${WRKSRC}/doc/Makefile.in
.endif
	@${CHMOD} +x ${WRKSRC}/install-sh

.include <bsd.port.mk>
