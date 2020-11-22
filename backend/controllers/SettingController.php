<?php



namespace backend\controllers;



use Yii;

use backend\models\Setting;

use backend\models\SettingSearch;

use yii\web\Controller;

use yii\web\NotFoundHttpException;

use yii\filters\VerbFilter;

use yii\web\UploadedFile;



/**

 * SettingController implements the CRUD actions for Setting model.

 */

class SettingController extends Controller

{

    /**

     * {@inheritdoc}

     */

    public function behaviors()

    {

        return [

            'verbs' => [

                'class' => VerbFilter::className(),

                'actions' => [

                    'delete' => ['POST'],

                ],

            ],

        ];
    }



    /**

     * Lists all Setting models.

     * @return mixed

     */

    public function actionIndex()

    {

        if (Yii::$app->user->isGuest) {

            header("Location: index.php");

            exit;
        }

        $searchModel = new SettingSearch();

        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);



        return $this->render('index', [

            'searchModel' => $searchModel,

            'dataProvider' => $dataProvider,

        ]);
    }



    /**

     * Displays a single Setting model.

     * @param integer $id

     * @return mixed

     * @throws NotFoundHttpException if the model cannot be found

     */

    public function actionView($id)

    {

        if (Yii::$app->user->isGuest) {

            header("Location: index.php");

            exit;
        }

        return $this->render('view', [

            'model' => $this->findModel($id),

        ]);
    }



    /**

     * Creates a new Setting model.

     * If creation is successful, the browser will be redirected to the 'view' page.

     * @return mixed

     */

    public function actionCreate()

    {

        if (Yii::$app->user->isGuest) {

            header("Location: index.php");

            exit;
        }

        $model = new Setting();



        if ($model->load(Yii::$app->request->post()) && $model->save(false)) {

            return $this->redirect(['view', 'id' => $model->id_setting]);
        }



        return $this->render('create', [

            'model' => $model,

        ]);
    }



    /**

     * Updates an existing Setting model.

     * If update is successful, the browser will be redirected to the 'view' page.

     * @param integer $id

     * @return mixed

     * @throws NotFoundHttpException if the model cannot be found

     */

    public function actionUpdate($id)

    {

        if (Yii::$app->user->isGuest) {

            header("Location: index.php");

            exit;
        }

        $model = $this->findModel($id);



        if ($model->load(Yii::$app->request->post())) {



            $model->foto = UploadedFile::getInstance($model, 'foto');



            $model->save();



            return $this->redirect(['view', 'id' => $model->id_setting]);
        }



        return $this->render('update', [

            'model' => $model,

        ]);
    }



    /**

     * Deletes an existing Setting model.

     * If deletion is successful, the browser will be redirected to the 'index' page.

     * @param integer $id

     * @return mixed

     * @throws NotFoundHttpException if the model cannot be found

     */

    public function actionDelete($id)

    {

        if (Yii::$app->user->isGuest) {

            header("Location: index.php");

            exit;
        }

        $this->findModel($id)->delete();



        return $this->redirect(['index']);
    }



    /**

     * Finds the Setting model based on its primary key value.

     * If the model is not found, a 404 HTTP exception will be thrown.

     * @param integer $id

     * @return Setting the loaded model

     * @throws NotFoundHttpException if the model cannot be found

     */

    protected function findModel($id)

    {

        if (($model = Setting::findOne($id)) !== null) {

            return $model;
        }



        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
