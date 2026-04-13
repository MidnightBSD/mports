PORTNAME=	edict
PORTVERSION=	19990714
PORTREVISION=	7
CATEGORIES=	japanese
MASTER_SITES=	http://ftp.edrdg.org/pub/Nihongo/
DISTFILES=	${DICTFILES} ${SRCFILES} ${DOCFILES}
DIST_SUBDIR=	edict
EXTRACT_ONLY=	${SRCFILES}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Japanese-English dictionaries with access and maintenance utilities
WWW=		http://ftp.monash.edu.au/pub/nihongo/00INDEX.html

LICENSE=	gpl

# Fix build with clang11
CFLAGS+=	-fcommon

DICTFILES=	edict.gz edicth enamdict.gz compdic.gz \
		j_places.gz ediclsd3.zip \
		kanjidic.gz kanjd212.gz lawgledt.zip \
		lingdic.zip geodic.gz pandpdic.zip \
		aviation.zip findic.zip mktdic.zip \
		4jword3_edict.zip concrete.zip

SRCFILES=	xjdic23.tgz

DOCFILES=	edict_doc.html edicth.doc \
		enamdict_doc.txt enamdict_doc.html \
		j_places.inf kanjidic.doc kanjd212.doc ediclsd3.rme \
		lawgldoc.new lingdic.txt geodic.doc aviation.txt \
		findic.doc mktdic.doc 4jword3_inf.txt \
		concrete.doc

BINFILES=	exjdxgen xjdic_cl xjdic_sa xjdserver xjdxgen

# Where to install the data files
DATADIR=	${PREFIX}/share/dict/edict
DOCSDIR=	${PREFIX}/share/doc/xjdic

NO_WRKSUBDIR=	yes

OPTIONS_DEFINE=	DOCS

.include <bsd.mport.options.mk>

CFLAGS+=	-Wno-error=incompatible-function-pointer-types

post-patch:
	@${GREP} -l '^main' ${WRKSRC}/*.c | ${XARGS} ${REINPLACE_CMD} \
		-e '/argv/s/unsigned//'

do-install:
	(cd ${WRKSRC} && ${INSTALL_PROGRAM} ${BINFILES} ${PREFIX}/bin)
	@${MKDIR} ${DATADIR}
	${CP} ${_DISTDIR}/edicth ${DATADIR}
.for f in edict enamdict compdic j_places kanjidic kanjd212 geodic
	${GZIP_CMD} -cd ${_DISTDIR}/${f}.gz > ${DATADIR}/${f}
.endfor
.for f in ediclsd3 lawgledt lingdic pandpdic aviation findic mktdic \
	4jword3_edict concrete
	cd ${DATADIR} && \
		${TAR} -xf ${_DISTDIR}/${f}.zip ${f:S|edict|edict.euc|}
.endfor
.for dict in ${DICTFILES:S|_edict|_edict.euc|}
	(cd ${DATADIR} && ${PREFIX}/bin/xjdxgen ${dict:R})
	(cd ${DATADIR} && ${CHMOD} ${SHAREMODE} \
		${dict:R} ${dict:R}.xjdx)
.endfor
	${RM} ${PREFIX}/bin/xjdic
	(cd ${PREFIX}/bin && ${LN} -s xjdic_sa xjdic)
	(cd ${WRKSRC} && ${INSTALL_DATA} radicals.tm radkfile kanjstroke \
		romkana.cnv vconj ${DATADIR})
	#
	# Only 9 dictionaries can be enabled
	#
	@${ECHO_CMD} dicdir ${LOCALBASE}/${DATADIR_REL} > ${DATADIR}/.xjdicrc
	@${ECHO_CMD} dicfile edict >> ${DATADIR}/.xjdicrc
	@${ECHO_CMD} dicfile enamdict >> ${DATADIR}/.xjdicrc
	@${ECHO_CMD} dicfile compdic >> ${DATADIR}/.xjdicrc
	@${ECHO_CMD} dicfile ediclsd3 >> ${DATADIR}/.xjdicrc
	@${ECHO_CMD} dicfile j_places >> ${DATADIR}/.xjdicrc
	# @${ECHO_CMD} dicfile lawgledt >> ${DATADIR}/.xjdicrc
	@${ECHO_CMD} dicfile geodic >> ${DATADIR}/.xjdicrc
	# @${ECHO_CMD} dicfile pandpdic >> ${DATADIR}/.xjdicrc
	@${ECHO_CMD} dicfile aviation >> ${DATADIR}/.xjdicrc
	# @${ECHO_CMD} dicfile findic >> ${DATADIR}/.xjdicrc
	# @${ECHO_CMD} dicfile mktdic >> ${DATADIR}/.xjdicrc
	@${ECHO_CMD} dicfile 4jword3_edict.euc >> ${DATADIR}/.xjdicrc
	# @${ECHO_CMD} dicfile concrete.doc >> ${DATADIR}/.xjdicrc
	# @${ECHO_CMD} dicfile lingdic >> ${DATADIR}/.xjdicrc
	@${CHMOD} ${SHAREMODE} ${DATADIR}/.xjdicrc
	${INSTALL_MAN} ${WRKSRC}/xjdic.1 ${PREFIX}/share/man/man1

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/xjdic23.inf ${FAKE_DESTDIR}${DOCSDIR}
	(cd ${_DISTDIR} && ${INSTALL_DATA} ${DOCFILES} ${FAKE_DESTDIR}${DOCSDIR})

.include <bsd.port.mk>
